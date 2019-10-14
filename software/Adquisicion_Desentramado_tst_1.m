global puerto; %Crea el objeto puerto
puerto=serial('COM8','BaudRate',8000,'Terminator','LF');   %Configutaciond e los parametros del puerto
fopen(puerto); %abre el puerto
flush = 3;

buffersize = 80;
    dac=3/(2^16); %Factor de conversión del ADC del microprocesador

    aux=fread(puerto,[1,buffersize],'uint8'); 
        %flush del puerto
    flush=flush+1;
    if flush>2
    flushinput(puerto)
    flush=0;
    end
    i=1;
    
    
    while aux(i)>127
        i=i+1;
    end  
 

    bin=dec2bin(aux);    
    while i<(buffersize-4)
       Medida_Sonar = strcat(bin(i,3:8),bin(i+1,2:8),bin(i+3,4:8));
       Medida_Lidar = bin(i+4,2:8);
       Numero_de_Pasos = bin(i,3:3);
       
       alfa = Numero_de_Pasos*3.5;
       X_Sonar = bin2dec(Medida_Sonar)*sin(alfa);
       Y_Sonar = bin2dec(Medida_Sonar)*cos(alfa);
       X_Lidar = bin2dec(Medida_Lidar)*sin(alfa);
       Y_Lidar = bin2dec(Medida_Lidar)*cos(alfa);
       stem(X_Sonar,Y_Sonar);
       hold on
       stem(X_Lidar,Y_Lidar);
       hold off
       i=i+5;
       
       instrreset
       %A;adido de puntos a la grafica
       
    end