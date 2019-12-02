clear all

clc

zonas = ['000';'001';'010';'011';'100';'101';'110']
b3 = strcat('00',zonas(3,:),zonas(1,:))

%ASCII
message = ''
aux = dec2bin(message)
class(aux)
l = length(aux)
mesax = aux
for c = 1:8-l
    mesax = strcat('0',mesax)
end

%%
%BIN
clear all 
clc
message = '0101'

l = length(message)
if l<8
    mesax = message
    for c = 1:8-l
        mesax = strcat('0',mesax)
    end
else
    mesax = message(1:8)
end
%%
%DEC
clear all 
clc
message = '1'
aux = str2num(message)
if aux >255||aux<0
    aux = 255
end
aux2 = dec2bin(aux)

l = length(aux2)
mesax = aux2
for c = 1:8-l
    mesax = strcat('0',mesax)
end
