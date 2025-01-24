MODEL_PATH=${MODEL_PATH}

export TP_SOCKET_IFNAME=eth1
# export VLLM_LOGGING_LEVEL=DEBUG
export NCCL_SOCKET_IFNAME=eth1
export GLOO_SOCKET_IFNAME=eth1

export VLLM_HOST_IP=$LOCAL_IP

python3 -m vllm.entrypoints.openai.api_server \
    --host ${LOCAL_IP} \
    --port 8020 \
    --trust-remote-code \
    --model ${MODEL_PATH} \
    --distributed-executor-backend ray \
    --disable-custom-all-reduce \
    --gpu_memory_utilization 0.92 \
    --tensor-parallel-size 1 \
    --pipeline-parallel-size 1 \
    --dtype bfloat16 \
    --disable-log-stats \
    --max-num-seqs 8 \
    --enforce-eager \
    --use-v2-block-manager \
    2>&1 | tee log_server.txt