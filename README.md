# MVASM

## Datasets
* [COIL20](http://www.cs.columbia.edu/CAVE/software/softlib/coil-20.php)
* [MNIST](http://yann.lecun.com/exdb/mnist/)
* [YALE](http://www.cad.zju.edu.cn/home/dengcai/Data/FaceData.html)

Three heterogeneous feature descriptors are ISO.m, LDA.m, and NPE.m.

## Parameters
For different datasets, their parameters can be set as follows:
* COIL:  qStart = 1; qNum = 96; qStride = 0.01; rStart = 0; rNum = 4; rStride = 0.1
* MNIST: qStart = 1.6; qNum = 2; qStride = 0.01; rStart = 0; rNum = 2; rStride = 0.1
* YALE: qStart = 1; qNum = 11; qStride = 0.01; rStart = 0; rNum = 9; rStride = 0.1

## Reference
* Multi-View K-Means Clustering on Big Data. (IJCAI,2013).
* Discriminatively Embedded K-Means for Multi-view Clustering. (CVPR,2016)
* Robust and Sparse Fuzzy K-Means Clustering. (IJCAI2016)
* A new simplex sparse learning model to measure data similarity for clustering (AAAI2015)
* COMPACT: A Comparative Package for Clustering Assessment. (ISPA2005)
* https://github.com/ZJULearning/MatlabFunc/tree/master/Clustering
