#include <stdio.h>
#include <stdlib.h>

int main(){

    void entramado(char posicion, int sonar, int lidar, char Data[]){    
        
        Data[0] = (posicion&0b01111111);
        
        Data[1] = (sonar&0b0000000001111111)|0b0000000010000000;
        
        Data[2] = (((sonar<<5)&0b0000000001100000)|((lidar>>7)&0b0000000000011111)))|0b00000000010000000;
        
        Data[3] = (lidar&0b0000000001111111)|0b0000000010000000;
        
    }


    return 0;
}
