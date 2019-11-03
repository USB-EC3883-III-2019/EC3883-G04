clear all
clc

register = fopen('data_log.txt','wt');
format = 'Position=%d | Sonar = %d | Lidar = %d | Fusion = %d]\n';


fprintf(register,format,dpos,aux_Sonar,aux_Lidar,aux_Fusion);



fclose(register);
