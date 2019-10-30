global puerto; %Crea el objeto puerto
puerto=serial('COM8','BaudRate',9800,'Terminator','LF');   %Configutaciond e los parametros del puerto
fopen(puerto); %abre el puerto
muestra = 600;
s.InputBufferSize = muestra;   
    aux=fread(puerto,[1,muestra],'uint8'); 
    posiciones = zeros(1,muestra);
    i=1;
    
    
    while aux(i)>127
        i=i+1;
    end  
    j = 1;

    bin=dec2bin(aux);    
    while i<(muestra-10)
  
       Numero_de_Pasos = bin(i,3:8);
       posiciones(j) = bin2dec(Numero_de_Pasos);
       j = j+1;
       i=i+4;
            
    end
    
    instrreset
   
