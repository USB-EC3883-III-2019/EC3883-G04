                %Esto va justo ENCIMA de Port Creation (debe quedar en la linea entre la  creacion de r_pos y Port Creation)
                global r_fusion;
                r_fusion = zeros(1,length(theta));



                %Esto va EN Including Global Variables
                global r_fusion;

                %Esto va DESPUES de Data Storage
                %Fusion Crafting
                if Sonar_Data > 10 && Sonar_Data < Lidar_Data
                    r_fusion(pos) = Sonar_Data;
                else
                    r_fusion(pos) = Lidar_Data;
                end
                
                %Esto va EN Polar to Cartesian Coordinates Conversion
                [x_fusion, y_fusion] = pol2cart(theta,r_fusion);
                
                %Esto va ANTES de Increase For The Port Flush Counter
                %Ploting the Fusion
                if %Aca va el chekeo de la condicion del boton Fusion (que hay que poner en la app :v)
                    stem(app.Axes,x_fusion,y_fusion,'.','r','LineStyle','none')
                end