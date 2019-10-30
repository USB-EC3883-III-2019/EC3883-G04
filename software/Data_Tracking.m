global puerto; %Crea el objeto puerto
puerto=serial('COM8','BaudRate',9800,'Terminator','LF');   %Configutaciond e los parametros del puerto
fopen(puerto); %abre el puerto

  
    aux=fread(puerto,[1,300],'uint8'); 
    posiciones = zeros(1,300);
    i=1;
    
    
    while aux(i)>127
        i=i+1;
    end  
 

    bin=dec2bin(aux);    
    while i<(290)

       Numero_de_Pasos = bin(i,3:8);
       posiciones(i) = bin2dec(Numero_de_Pasos);

       i=i+4;
            
    end
    
    instrreset
   