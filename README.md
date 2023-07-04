

RT.

图像识别一直是很热门的话题，因此跟热点的bytetriper这次任务是做简单的手写数字识别！

大家都知道，AI已经杀死了CV（计算机视觉），但守旧的bytetriper不喜欢神经网络，因此决定把这个任务出成开放题，交给各位解决。

# 任务描述

在本题中，你只需要解决基础的灰度图片单个数字识别的问题。即给定一张灰度图片，输出0-9的一个数字作为你的预测。

例如：
!["6"](https://raw.githubusercontent.com/bytetriper/img/main/6.png)  应该被分类为6

![难以辨认的4](https://raw.githubusercontent.com/bytetriper/img/main/8.png) 应该被分类为4（虽然很像9）

具体来讲，你需要实现`src.h`中的`judge`函数并将整个`src.h`上交到OJ。
   
```cpp
typedef std::vector<std::vector<double>> IMAGE_T;
int judge(IMAGE_T &img);
```

其中`IMAGE_T`为一个二维vector，即图片的二维数组表示，数据存储约定见后。

## 数据
所有数据和代码都已放在[Code Repo](https://github.com/bytetriper/Number-Recognition)

我们对图片的存储方式做如下规定：

* 所有图像均被表示为二维数组$A_{N\times N},A_{i,j}\in [0,1]$，其中1为纯白，0为纯黑。
* 所有图像都由png/ppm格式储存。
* 数字都为白色，且符合人类正常书写规律。不会出现倒着写，横着写的情况。例图详见：
* 保证数字一定存在于图片中，但不对数字的形状、大小、区域做任何保证。
* 数据均已下发，详见仓库中的`data/`：


## Prerequisite

* 由于使用C++读入png/jpg/jpeg图片非常不方便，我们下发了ppm格式的图片以方便读取。当然，你也可以自行实现读取jpeg格式的图片。
* 同时，我们也给出了读取ppm的代码，你可以直接使用。
* 虽然文件以ppm格式存储，但内容实际是P5的PGM，即灰度图。你可以在[这里](http://netpbm.sourceforge.net/doc/pgm.html)查看PGM的具体格式。
  
### Read from ppm
* 源文件`read_support.cpp`与`read_support.h`已下发在仓库中。
`read_support.h` 中提供了两个函数的接口：

```cpp
typedef std::vector<std::vector<double>> IMAGE_T;
IMAGE_T read_ppm(const std::string &filename);
IMAGE_T read_ppm();
void check(IMAGE_T mat);
```

* ```read_ppm```函数接受一个字符串作为ppm文件地址，返回一个二维vector，即图片的二维数组表示，数据存储约定见前。没有参数的`read_ppm`函数行为和上述函数相同，但是会从标准输入读取ppm文件。
* ```check```函数接受一个二维vector，并在控制台输出该二维vector的内容，以方便你调试。


## 评分
本题评分标准如下：

我们希望衡量的是算法的正确的概率。假设在测试数据集里，对于一个固定的label $k$， 你预测正确了其中的$M_k$个，那么你的得分为：

$$
\frac{M_k}{N_k}\times 1000
$$

其中$M_k$为label为$N_k$的测试数据总数。

最后，你的得分为所有label的得分的总和，因此最高总分为10000。

具体来说，第$i$个测试点的得分反应你对于label $i$的预测的正确率。因此你可以通过查看各个测试点的分值来针对性的做出优化。

上交到OJ的代码会在测试集数据下进行测试。请注意：**测试数据集与下发数据不同**。

## 本地测试
欢迎在本地用下发数据自行评测结果，评测代码详见：

具体评测方式：
* `make`，由于stdc++17在MINGW上的path实现有一些问题，请尽量使用linux或者WSL进行测试。
* 如果希望简单地在所有下发数据上测试，请使用：`./test`，输出为在所有数据上的正确率。
* 如果希望对某个label的数据进行测试，请使用：`./test [label]`（如`./test 1`），输出为在该label上的正确率。
* 你也可以自行改动代码以实现更精细的评测。

## Reminders
鉴于bytetriper希望这是一道人类智慧题，而不是人工智能题，有一些tips送给大家：

* 测试数据集和下发的数据都随机采样自同一个数据集MNIST，这意味他们在特征上基本相同，同时，测试集的大小是下发数据集的$60$倍。由于测试集和下发集不相同，你的算法在本地上跑出的结果很可能不同于OJ上的结果。
* **禁止上网路查询信息**，同时，禁止直接使用任何图象处理库的代码，包括但不限于opencv，PIL，skimage等。由于OJ本身没有相关库支持，因此这里的禁止使用指的是不能抄袭相关库实现。
* 对于依旧使用人工智能方法的同学，我们会对准确率高的代码手动检查，请特别注意PPCA网络限制包括但不限于：
   1. **不允许使用任何外部数据**
   2. **不允许使用任何预训练模型**
* 由于查看二进制PPM比较困难，（使用VSC的）同学可以下载VSCode的插件来查看PPM文件，这是被允许的。同时，有些浏览器原生支持PPM格式，也可以使用浏览器打开PPM文件。
* 如果实在无法查看PPM，可以查看`png_data/`下的png格式文件，这与ppm是完全相同的。




