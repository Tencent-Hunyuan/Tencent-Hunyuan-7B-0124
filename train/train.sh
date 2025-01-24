#!/bin/bash

export HOST_GPU_NUM=8
# 当前机器ip
export LOCAL_IP=${ip1}
# 多节点机器ip，逗号隔开
export NODE_IP_LIST="${ip1}:8,${ip2}:8"
# 机器节点个数
export NODES=2
export NODE_NUM=$((${NODES} * ${HOST_GPU_NUM}))

export NCCL_DEBUG=WARN

model_path=path_to_model_weight
tokenizer_path=../models
train_data_file=example_data.jsonl

# ds_config_file=ds_zero2_no_offload.json
# ds_config_file=ds_zero3_no_offload.json
ds_config_file=ds_zero3_offload_no_auto.json

output_path=/root/hf_train_output

mkdir -p ${output_path}

current_time=$(date "+%Y.%m.%d-%H.%M.%S")
log_file=${output_path}/"log_${current_time}.txt"

echo $NODE_IP_LIST > env.txt 2>&1 &
sed "s/:/ slots=/g" env.txt | sed "s/,/\n/g" >  "hostfile"
sed "s/:.//g" env.txt | sed "s/,/\n/g" >  "pssh.hosts"
export CHIEF_IP=$LOCAL_IP

HOST_PATH=hostfile
# HOST_PATH=none

deepspeed --hostfile=$HOST_PATH --master_addr $CHIEF_IP train.py \
    --do_train \
    --model_name_or_path ${model_path} \
    --tokenizer_name_or_path ${tokenizer_path} \
    --train_data_file ${train_data_file} \
    --deepspeed ${ds_config_file} \
    --output_dir ${output_path} \
    --overwrite_output_dir \
    --per_device_train_batch_size 1 \
    --gradient_accumulation_steps 1 \
    --gradient_checkpointing \
    --lr_scheduler_type cosine_with_min_lr \
    --logging_steps 1 \
    --max_steps 200 \
    --save_steps 100 \
    --learning_rate 1e-5 \
    --min_lr 1e-6 \
    --warmup_ratio 0.01 \
    --save_strategy steps \
    --save_safetensors False \
    --use_lora \
    --lora_rank 64 \
    --lora_alpha 128 \
    --lora_dropout 0.1 \
    --hidden_size 6400 \
    --intermediate_size 18304 \
    --model_max_length 4096 \
    --max_seq_length 4096 \
    --moe_topk 1 \
    --num_experts 2 \
    --num_attention_heads 80 \
    --num_key_value_heads 8 \
    --num_layers 4 \
    --cla_share_factor 2 \
    --use_cla \
    --use_mixed_mlp_moe \
    --num_shared_expert 1 \
    --use_qk_norm \
    --bf16 | tee ${log_file}
