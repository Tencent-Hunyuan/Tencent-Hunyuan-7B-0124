
<p align="center">
 <img src="https://dscache.tencent-cloud.cn/upload/uploader/hunyuan-64b418fd052c033b228e04bc77bbc4b54fd7f5bc.png" width="400"/> <br>
</p><p></p>

<p align="center">
    🫣&nbsp<a href="https://huggingface.co/tencent/"><b>Hugging Face</b></a>&nbsp&nbsp

## 模型介绍

本次混元发布的7B模型：[Hunyuan-7B-Pretrain](https://huggingface.co/tencent/Hunyuan-7B-Pretrain)和[Hunyuan-7B-Instruct](https://huggingface.co/tencent/Hunyuan-7B-Instruct) ，采用了更优的数据配比与训练，拥有强劲的性能，在计算与性能间取得良好平衡的优势从众多规模的语言模型中脱颖而出，是目前最强的中文7B Dense模型之一。
### 技术优势介绍

#### 模型  

- 使用了GQA的同时，将长文能力拓展到256K。

#### 推理框架
- 模型支持 TRT-LLM-backend 和 [vLLM-backend](https://github.com/quinnrong94/vllm/tree/dev_hunyuan) 推理框架。本次优先开源vLLM框架，TRT-LLM将在近期推出。

#### 训练框架
- Hunyuan-Large开源模型已经支持huggingface格式，支持用户采用hf-deepspeed框架进行模型精调。详情可以参照[Tencent-Hunyuan-Large](https://github.com/Tencent/Tencent-Hunyuan-Large) 。

&nbsp;

## 新闻
* 2025.1 我们在Hugging Face开源了**Hunyuan-7B-Pretrain** 、 **Hunyuan-7B-Instruct** 。
<br>


## Benchmark评估榜单 

注：下列Benchmark均为 TRT-LLM-backend 测评得出
**Hunyuan-7B-Pretrain**

|                  | Qwen2.5-7B | HunYuan-7B-V2 |
|------------------|------------|---------------|
| MMLU             | 74.26      | **75.37**         |
| MMLU-Pro         | 46.17      | **47.54**         |
| MMLU-CF          | **61.01**      | 59.62         |
| MMLU-Redux       | 73.47      | **74.54**         |
| BBH              | 70.4       | **70.77**         |
| HellaSwag        | 75.82      | **80.77**         |
| WinoGrande       | 69.69      | **71.51**         |
| PIQA             | 79.33      | **81.45**         |
| SIQA             | 77.48      | **79.73**         |
| NaturalQuestions | 31.77      | **33.52**         |
| DROP             | 68.2       | **68.63**         |
| ARC-C            | 91.64      | **91.97**         |
| TriviaQA         | 69.31      | **74.31**         |
| Chinese-SimpleQA | 30.37      | **30.51**         |
| SimpleQA         | **4.98**       | 3.73          |
| CMMLU            | 81.39      | **82.19**         |
| C-Eval           | 81.11      | **82.12**         |
| C3               | 71.77      | **79.07**         |
| GSM8K            | 82.71      | **93.33**         |
| MATH            | 49.6       | **62.15**         |
| CMATH            | 84.33      | 	 **88.5**        |
| HumanEval       | 57.93      | **59.15**         |



**Hunyuan-7B-Instruct**

| Model                | Qwen2.5-7B-Instruct | Hunyuan-7B-Instruct | 
|----------------------|---------------------|-------------------|
| ARC-C                 | **89.83**           | 88.81             | 
| BBH                 | 66.24               | **76.47**         |
| CEval                 | 76.82               | **81.8**          | 
| CMMLU                 | 78.55               | **82.29**         | 
| DROP_F1                 | 80.63               | **82.96**         | 
| GPQA                 | 36.87               | **47.98**         | 
| Gsm8k                 | 80.14               | **90.14**         | 
| HellaSwag                 | 83.34               | **86.57**         | 
| HumanEval                 | **84.8**                | 84.0              | 
| MATH                 | **72.86**           | 70.64             | 
| MMLU                 | 72.36               | **79.18**         | 



## 快速开始

您可以参考[Tencent-Hunyuan-Large](https://github.com/Tencent/Tencent-Hunyuan-Large) 中的内容进行快速上手。

### 性能评估：

本部分介绍采用vLLM部署各个模型的效率测试结果，包括不同Batchsize下的推理速度(tokens/s)。

| 推理框架 | 模型                      | 部署卡数（卡型1） | input_length | batch=1             | batch=4              |
|------|-----------------------------|-----------|-------------------------|---------------------|----------------------|
| vLLM | hunyuan-7B                  | 1         | 2048                  | 78.9                | 279.5                  |

## 联系我们
如果你想给我们的研发和产品团队留言，欢迎联系我们腾讯混元LLM团队。你可以通过邮件（hunyuan_opensource@tencent.com）联系我们。
