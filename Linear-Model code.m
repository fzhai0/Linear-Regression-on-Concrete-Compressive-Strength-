format longG %对数据取消科学记数法

x = concrete(:,1:8); %定义自变量，第1至8列8个混凝土系数定义为自变量
y = concrete(:,9); %定义因变量，为抗压系数
X = [x,1]; %把数据集中前8（d）个属性输入到X矩阵

w = (X'.*X)^-1.*X'.*y;%求解线性常数
%此处直接利用书中最后结论，得到该项运算过程省略

f_x = w.*x';%用线性常数来表述线性模型

beta = x\y;

lm = fitlm(x,y);

plot(x,f_x)%绘制线性模型

[N,k] = size(x); 
betahat = (x'*x)\x'*y;

res = y - x*betahat; %残差
sigma2hat = 1/(N-k) * (res'*res); %betahat方差估计值

cov = sigma2hat * (x'*x)^(-1); %betahat协方差
se = sqrt(diag(cov)); %标准差
se_beta = se(1:k);
tvalue = betahat./se_beta;


