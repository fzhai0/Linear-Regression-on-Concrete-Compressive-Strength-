format longG %������ȡ����ѧ������

x = concrete(:,1:8); %�����Ա�������1��8��8��������ϵ������Ϊ�Ա���
y = concrete(:,9); %�����������Ϊ��ѹϵ��
X = [x,1]; %�����ݼ���ǰ8��d�����������뵽X����

w = (X'.*X)^-1.*X'.*y;%������Գ���
%�˴�ֱ���������������ۣ��õ������������ʡ��

f_x = w.*x';%�����Գ�������������ģ��

beta = x\y;

lm = fitlm(x,y);

plot(x,f_x)%��������ģ��

[N,k] = size(x); 
betahat = (x'*x)\x'*y;

res = y - x*betahat; %�в�
sigma2hat = 1/(N-k) * (res'*res); %betahat�������ֵ

cov = sigma2hat * (x'*x)^(-1); %betahatЭ����
se = sqrt(diag(cov)); %��׼��
se_beta = se(1:k);
tvalue = betahat./se_beta;


