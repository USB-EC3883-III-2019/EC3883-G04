classdef Sonar_Lidar_App_V_1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure      matlab.ui.Figure
        Axes          matlab.ui.control.UIAxes
        StartButton   matlab.ui.control.Button
        SonarButton   matlab.ui.control.StateButton
        LidarButton   matlab.ui.control.StateButton
        OnOffButton   matlab.ui.control.StateButton
        FusionButton  matlab.ui.control.StateButton
    end


    methods (Access = public)
    
        function results = func(app)
            
        end
        
    end


    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            %Variable Creation And Setting
            global pos 
            pos = 1;
            global step;
            step = 3.75;
            global top;
            top = 31;
            global top_grade;
            top_grade = step*top;
            
            global boton_on;
            boton_on = 0;
            
            global boton_sonar;
            boton_sonar = 0;
            
            global boton_lidar ;
            boton_lidar = 0;
            
            global boton_fusion;
            boton_fusion = 0;
            
            global theta;
            theta = -1*(-pi/2+pi/180*[-top_grade:step:top_grade]);
            
            
            global r_sonar;
            r_sonar = zeros(1,length(theta));

            global r_lidar;
            r_lidar = zeros(1,length(theta));

            
            global r_pos;
            r_pos = 90*ones(1,length(theta));
                
            global r_fusion;
            r_fusion = zeros(1,length(theta));
            
            %Port Creation
            global puerto;
            %Port Configuration
            %JIANLUK CHANGE THE PORT TO THE ONE YOU USEEEEEEEEEEEEEEEEEEEEEEEEEEE
            %(????)?????            
            %JIANLUK CHANGE THE PORT TO THE ONE YOU USEEEEEEEEEEEEEEEEEEEEEEEEEEE
            %(????)?????
            %JIANLUK CHANGE THE PORT TO THE ONE YOU USEEEEEEEEEEEEEEEEEEEEEEEEEEE
            %(????)?????
            %JIANLUK CHANGE THE PORT TO THE ONE YOU USEEEEEEEEEEEEEEEEEEEEEEEEEEE
            %(????)?????
            %JIANLUK CHANGE THE PORT TO THE ONE YOU USEEEEEEEEEEEEEEEEEEEEEEEEEEE
            %(????)?????
            %JIANLUK CHANGE THE PORT TO THE ONE YOU USEEEEEEEEEEEEEEEEEEEEEEEEEEE
            %(????)?????
            %JIANLUK CHANGE THE PORT TO THE ONE YOU USEEEEEEEEEEEEEEEEEEEEEEEEEEE
            %(????)?????
            %JIANLUK CHANGE THE PORT TO THE ONE YOU USEEEEEEEEEEEEEEEEEEEEEEEEEEE
            %(????)?????
            puerto=serial('COM8','BaudRate',9600);
            puerto.InputBufferSize = 10000000;
            %Port Open
            fopen(puerto); 
            
            
            
            
            
            
        end

        % Value changed function: LidarButton
        function Lidar(app, event)
            global boton_lidar
            value = app.LidarButton.Value;
            boton_lidar = value;
            global theta
            global r_lidar
            %r_lidar = zeros(1,length(theta));
      
        end

        % Button pushed function: StartButton
        function Loop(app, event)
            %Including Global Variables
            global puerto;
            global r_pos;
            global theta;
            global r_lidar;
            global r_sonar;
            global r_fusion;
            global pos;
            global boton_on;
            global boton_sonar;
            global boton_lidar;
            global boton_fusion;
            global flush
            flush=0;
            global x_sonar
            global y_sonar
            global x_lidar
            global y_lidar
            
            buffersize = 10000;
            

            if boton_on==1
            while  boton_on~=0
               
                
              %Port Flush
              %  flush=flush+1;
                
             %   if flush>1
              %  flushinput(puerto)
               % flush = 0;
                %end                
                
                
                %Port Data Reading
                aux = fread(puerto,[1,buffersize],'uint8'); 
                

                i = 1;
                
                while aux(i)>63
                    i=i+1
                end
                
                %Data Get
                bin = dec2bin(aux);

                %Data Decode
                while i<(buffersize-4)
                   Sonar_Data = strcat(bin(i+1,3:8),bin(i+2,2:3));
                  
                   Lidar_Data = strcat(bin(i+2,4:8),bin(i+3,2:8));
                   
                   pos = bin(i,3:8);
                   
                  i=i+4;
                  
                %end
                boton_lidar;
                boton_on;
                boton_sonar;            

                dpos=bin2dec(pos)
               
               
                %Here should Go The Necessary Data Preprocessing
                aux_Sonar = bin2dec(Sonar_Data)*122/58;
                %aux_Lidar = 294238.093*(bin2dec(Lidar_Data)^-1.38)
                aux_Lidar = 207650*(bin2dec(Lidar_Data)^-1.391)
                
                %Data Storage
                r_sonar(dpos) = aux_Sonar;
                r_lidar(dpos) = aux_Lidar;
                
                %Fusion Calc
               % if (Sonar_Data > 10) && (Sonar_Data < Lidar_Data)
                %   r_fusion(pos) = Sonar_Data;
               % else
                %    r_fusion(pos) = Lidar_Data;
               % end                
                
                %Polar to Cartesian Coordinates Conversion
                [x_sonar, y_sonar] = pol2cart(theta,r_sonar);
            
                [x_lidar, y_lidar] = pol2cart(theta,r_lidar);
                
                [x_fusion, y_fusion] = pol2cart(theta,r_fusion);
                
                [x_pos, y_pos] = pol2cart(theta,r_pos);    

                
                
               
                
                %This Is The Blue Line
                app.Axes.NextPlot = 'replacechildren';
                plot(app.Axes,[0 x_pos(dpos)],[0 y_pos(dpos)],'w','Linewidth',2)
                app.Axes.NextPlot = 'add';
                
                %Ploting The Sonar 
                if boton_sonar~=0

                    stem(app.Axes,x_sonar,y_sonar,'.','g','LineStyle','none')
              
                    
                end
                
                %Ploting The Lidar
                if boton_lidar~=0
                    stem(app.Axes,x_lidar,y_lidar,'.','r','LineStyle','none') 
                   
                    
                end
                
                if boton_fusion~=0
                    stem(app.Axes,x_fusion,y_fusion,'.','b','LineStyle','none')
                end
                
                drawnow;
                %Increase For The Port Flush Counter
                end
                %drawnow
                
            end
            end
            
        end

        % Value changed function: OnOffButton
        function On_Off(app, event)
            global boton_on;
            value = app.OnOffButton.Value;
            boton_on = value;

        end

        % Value changed function: SonarButton
        function Sonar(app, event)
            global boton_sonar;
            value = app.SonarButton.Value;
            boton_sonar = value;
            global r_sonar
            global theta
            %r_sonar = zeros(1,length(theta));
 
        end

        % Close request function: UIFigure
        function UIFigureCloseRequest(app, event)
            instrreset
            delete(app);
            
        end

        % Value changed function: FusionButton
        function Fusion(app, event)
            global boton_fusion;
            value = app.FusionButton.Value;
            boton_fusion = value;
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'UI Figure';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);

            % Create Axes
            app.Axes = uiaxes(app.UIFigure);
            xlabel(app.Axes, 'X')
            ylabel(app.Axes, 'Y')
            app.Axes.FontName = 'Arial';
            app.Axes.FontSize = 10;
            app.Axes.XLim = [-90 90];
            app.Axes.YLim = [-50 90];
            app.Axes.GridColor = [0.498 1 0];
            app.Axes.GridAlpha = 0.1;
            app.Axes.MinorGridColor = [0.498 1 0];
            app.Axes.MinorGridAlpha = 0.25;
            app.Axes.Box = 'on';
            app.Axes.XAxisLocation = 'origin';
            app.Axes.XColor = [1 1 1];
            app.Axes.XTick = [-80 -70 -60 -50 -40 -30 -20 -10 10 20 30 40 50 60 70 80];
            app.Axes.XTickLabel = {'-80'; '-70'; '-60'; '-50'; '-40'; '-30'; '-20'; '-10'; '10'; '20'; '30'; '40'; '50'; '60'; '70'; '80'};
            app.Axes.YAxisLocation = 'origin';
            app.Axes.YColor = [1 1 1];
            app.Axes.YTick = [-40 -30 -20 -10 10 20 30 40 50 60 70 80];
            app.Axes.YTickLabel = {'-40'; '-30'; '-20'; '-10'; '10'; '20'; '30'; '40'; '50'; '60'; '70'; '80'};
            app.Axes.LineWidth = 1;
            app.Axes.Color = [0 0 0];
            app.Axes.NextPlot = 'add';
            app.Axes.XGrid = 'on';
            app.Axes.YGrid = 'on';
            app.Axes.BackgroundColor = [1 1 1];
            app.Axes.Position = [105 68 432 347];

            % Create StartButton
            app.StartButton = uibutton(app.UIFigure, 'push');
            app.StartButton.ButtonPushedFcn = createCallbackFcn(app, @Loop, true);
            app.StartButton.BackgroundColor = [0.8 0.8 0.8];
            app.StartButton.FontSize = 14;
            app.StartButton.FontWeight = 'bold';
            app.StartButton.Position = [536 283 100 25];
            app.StartButton.Text = 'Start';

            % Create SonarButton
            app.SonarButton = uibutton(app.UIFigure, 'state');
            app.SonarButton.ValueChangedFcn = createCallbackFcn(app, @Sonar, true);
            app.SonarButton.Text = 'Sonar';
            app.SonarButton.BackgroundColor = [0.4706 0.6706 0.1882];
            app.SonarButton.FontSize = 14;
            app.SonarButton.FontWeight = 'bold';
            app.SonarButton.Position = [106 20 100 25];

            % Create LidarButton
            app.LidarButton = uibutton(app.UIFigure, 'state');
            app.LidarButton.ValueChangedFcn = createCallbackFcn(app, @Lidar, true);
            app.LidarButton.Text = 'Lidar';
            app.LidarButton.BackgroundColor = [0.9294 0.6902 0.1294];
            app.LidarButton.FontSize = 14;
            app.LidarButton.FontWeight = 'bold';
            app.LidarButton.Position = [438 20 100 25];

            % Create OnOffButton
            app.OnOffButton = uibutton(app.UIFigure, 'state');
            app.OnOffButton.ValueChangedFcn = createCallbackFcn(app, @On_Off, true);
            app.OnOffButton.Text = 'On/Off';
            app.OnOffButton.BackgroundColor = [0.8 0.8 0.8];
            app.OnOffButton.FontSize = 14;
            app.OnOffButton.FontWeight = 'bold';
            app.OnOffButton.Position = [537 328 100 25];

            % Create FusionButton
            app.FusionButton = uibutton(app.UIFigure, 'state');
            app.FusionButton.ValueChangedFcn = createCallbackFcn(app, @Fusion, true);
            app.FusionButton.Text = 'Fusion';
            app.FusionButton.BackgroundColor = [0.302 0.749 0.9294];
            app.FusionButton.FontSize = 14;
            app.FusionButton.FontWeight = 'bold';
            app.FusionButton.Position = [271 17 100 26];
        end
    end

    methods (Access = public)

        % Construct app
        function app = Sonar_Lidar_App_V_1

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end