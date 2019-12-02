clear all

clc

zonas = ['000';'001';'010';'011';'100';'101';'110']
b3 = strcat('00',zonas(3,:),zonas(1,:))

%ASCII
message = ''
aux = hex2dec(message)
aux2 = dec2bin(aux)
class(aux2)
l = length(aux2)
mesax = aux2
for c = 1:8-l
    mesax = strcat('0',mesax)
end
clear all 
clc
%BIN
message = '0101'

l = length(message)
if l<8
    mesax = message
    for c = 1:8-l
        mesax = strcat('0',mesax)
    end
else
    message = message(1:8)
end
