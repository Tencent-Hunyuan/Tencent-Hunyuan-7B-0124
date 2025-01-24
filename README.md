<p align="left">
    <a href="README_CN.md">中文</a>&nbsp ｜ English</a>
</p>
<br><br>

<p align="center">
 <img src="https://dscache.tencent-cloud.cn/upload/uploader/hunyuan-64b418fd052c033b228e04bc77bbc4b54fd7f5bc.png" width="400"/> <br>
</p><p></p>

<p align="center">
    🫣&nbsp<a href="https://huggingface.co/tencent/Hunyuan-7B-Instruct"><b>Hugging Face Hunyuan-7B-Instruct</b></a>&nbsp&nbsp | 🫣&nbsp<a href="https://huggingface.co/tencent/Hunyuan-7B-Pretrain"><b>Hugging Face Hunyuan-7B-Pretrain</b></a>&nbsp&nbsp

## Model Introduction

The 7B models released by Hunyuan this time: [Hunyuan-7B-Pretrain](https://huggingface.co/tencent/Hunyuan-7B-Pretrain) and [Hunyuan-7B-Instruct](https://huggingface.co/tencent/Hunyuan-7B-Instruct) , use better data allocation and training, have strong performance, and have achieved a good balance between computing and performance. It stands out from many large-scale language models and is currently one of the strongest Chinese 7B Dense models.

### Introduction to Technical Advantages

#### Model 

- Extended long text capability to 256K and utilizes Grouped Query Attention (GQA)

#### Inference Framework
- This open-source release offers two inference backend options tailored for the Hunyuan-7B model: the popular [vLLM-backend](https://github.com/quinnrong94/vllm/tree/dev_hunyuan) and the TensorRT-LLM Backend. In this release, we are initially open-sourcing the vLLM solution, with plans to release the TRT-LLM solution in the near future.

#### Training Framework
- The Hunyuan-7B open-source model is fully compatible with the Hugging Face format, enabling researchers and developers to perform model fine-tuning using the hf-deepspeed framework. Learn more : [Tencent-Hunyuan-Large](https://github.com/Tencent/Tencent-Hunyuan-Large) 。

&nbsp;

## Related News
* 2025.1.24 We have open-sourced  **Hunyuan-7B-Pretrain** , **Hunyuan-7B-Instruct** on Hugging Face.
<br>


## Benchmark

Note: The following benchmarks are evaluated by TRT-LLM-backend

**Hunyuan-7B-Pretrain**

|                  | Qwen2.5-7B | Llama3-8B  | OLMO2-7B | HunYuan-7B-V2 |
|------------------|------------|------------|----------|---------------|
| MMLU             | 74.26      | 66.95      | 63.7     | **75.37**         |
| MMLU-Pro         | 46.17      | 34.04      | 31       | **47.54**         |
| MMLU-CF          | **61.01**      | 55.21      | 52.94    | 59.62         |
| MMLU-Redux       | 73.47      | 66.44      | 63.74    | **74.54**         |
| BBH              | 70.4       | 62.16      | 38.01    | **70.77**         |
| HellaSwag        | 75.82      | 78.24      | 61.97    | **80.77**         |
| WinoGrande       | 69.69      | 73.64      | **74.43**    | 71.51         |
| PIQA             | 79.33      | 80.52      | **80.63**    | 81.45         |
| SIQA             | 77.48      | 61.05      | 65.2     | **79.73**         |
| NaturalQuestions | 31.77      | 35.43      | **36.9**     | 33.52         |
| DROP             | 68.2       | 60.13      | 60.8     | **68.63**         |
| ARC-C            | 91.64      | 77.59      | 74.92    | **91.97**         |
| TriviaQA         | 69.31      | **78.61**      | 78       | 74.31         |
| Chinese-SimpleQA | 30.37      | 19.4       | 7.35     | **30.51**         |
| SimpleQA         | 4.98       | **7.68**       | 4.51     | 3.73          |
| CMMLU            | 81.39      | 50.25      | 38.79    | **82.19**         |
| C-Eval           | 81.11      | 50.4       | 38.53    | **82.12**         |
| C3               | 71.77      | 61.5       | 54       | **79.07**         |
| GSM8K            | 82.71      | 57.54      | 67.5     | **93.33**         |
| MATH             | 49.6       | 18.45      | 19       | **62.15**         |
| CMATH            | 84.33      | 52.83      | 44       | **88.5**          |
| HumanEval        | 57.93      | 35.98      | 15.24    | **59.15**         |




**Hunyuan-7B-Instruct**

| Model       | Qwen2.5-7B-Instruct | Llama-3-8B-Instruct | OLMo-2-1124-7B-DPO | Hunyuan-7B-Instruct | 
|-------------|---------------------|---------------------|--------------------|-------------------|
| ARC-C       | **89.83**           | 82.4                | -                  | 88.81             | 
| BBH         | 66.24               | -                   | 46.6               | **76.47**         |
| CEval       | 76.82               | -                   | -                  | **81.8**          | 
| CMMLU       | 78.55               | -                   | -                  | **82.29**         | 
| DROP_F1     | 80.63               | -                   | 60.5               | **82.96**         | 
| GPQA        | 36.87               | 34.6                | -                  | **47.98**         | 
| Gsm8k       | 80.14               | 80.6                | 85.1               | **90.14**         | 
| HellaSwag   | 83.34               | -                   | -                  | **86.57**         | 
| HumanEval   | **84.8**            | 60.4                | -                  | 84.0              | 
| MATH        | **72.86**           | -                   | 32.5               | 70.64             | 
| MMLU        | 72.36               | 68.5                | 61.3               | **79.18**         | 



## Quick Start

You can refer to the content in [Tencent-Hunyuan-Large](https://github.com/Tencent/Tencent-Hunyuan-Large) to get started quickly. The training and inference code can use the version provided in this github repository.

### Docker:

To simplify the deployment process, HunyuanLLM provides a pre-built Docker image:

 [hunyuaninfer/hunyuan-large:dense-infer-open-source](https://hub.docker.com/layers/hunyuaninfer/hunyuan-large/dense-infer-open-source/images/sha256-3a39561d8262dac04fcb46e7860663158909720b76a28b94a54eb852524ae6a4). 

### Inference Performance

This section presents the efficiency test results of deploying various models using vLLM, including inference speed (tokens/s) under different batch sizes.

| Inference Framework | Model      | Number of GPUs (GPU productA) | input_length | batch=1             | batch=4              |
|------|------------|-------------------------|-------------------------|---------------------|----------------------|
| vLLM | hunyuan-7B | 1                       | 2048                  | 78.9                | 279.5                  |

## Contact Us

If you would like to leave a message for our R&D and product teams, Welcome to contact our open-source team . You can also contact us via email (hunyuan_opensource@tencent.com).