clear all
clc

register = fopen('data_log.txt','wt');
format = 'i=%d | j=[%d %d %d] \n';
i=1;
j=[1:3];



while i<101


fprintf(register,format,i,j);
i=i+1;

end



fclose(register);