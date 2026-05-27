// vector_add.cu
// 一个简单的 CUDA 程序：两个向量相加

#include <stdio.h>
#include <cuda_runtime.h>

// __global__ 核函数：在 GPU 上执行
__global__ void vecAdd(const float* a, const float* b, float* c, int n)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < n) {
        c[idx] = a[idx] + b[idx];
    }
}

int main()
{
    const int N = 1024;
    size_t bytes = N * sizeof(float);

    // 分配主机内存
    float* h_a = (float*)malloc(bytes);
    float* h_b = (float*)malloc(bytes);
    float* h_c = (float*)malloc(bytes);

    // 初始化向量
    for (int i = 0; i < N; ++i) {
        h_a[i] = i * 1.0f;
        h_b[i] = i * 2.0f;
    }

    // 分配设备内存
    float *d_a, *d_b, *d_c;
    cudaMalloc(&d_a, bytes);
    cudaMalloc(&d_b, bytes);
    cudaMalloc(&d_c, bytes);

    // 将数据从主机拷贝到设备
    cudaMemcpy(d_a, h_a, bytes, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, h_b, bytes, cudaMemcpyHostToDevice);

    // 配置核函数执行参数：256 个线程 / 块
    int threadsPerBlock = 256;
    int blocksPerGrid = (N + threadsPerBlock - 1) / threadsPerBlock;

    // 调用 __global__ 核函数
    vecAdd<<<blocksPerGrid, threadsPerBlock>>>(d_a, d_b, d_c, N);

    // 将结果拷贝回主机
    cudaMemcpy(h_c, d_c, bytes, cudaMemcpyDeviceToHost);

    // 验证部分结果（示例：打印前 10 个元素）
    printf("前 10 个相加结果：\n");
    for (int i = 0; i < (N < 10 ? N : 10); ++i) {
        printf("c[%d] = %f\n", i, h_c[i]);
    }

    // 释放内存
    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_c);
    free(h_a);
    free(h_b);
    free(h_c);

    return 0;
}
