hold off
x=1;
y=1;
t=0;

for i=1:10000;
d=randi([0,2]);
%%esquina derecha del triangulo  
    if(d== 0)
      t= 0.5*x +1;
      y= 0.5*y  ;
      x=t;
      
 %% pico del triangulo    
    elseif (d==1)
    
%% de la forma aX +B 
%% B modela la ubicacion de la punta , siendo 0.5 el centro
%% A modela  la distrubucion de los nuevos triangulos, siendo 0,5 la mas uniformemente distrubucion
      t= 0.5*x + 0.5;
%% de la forma y + h donde h es la altura para que el triangulo sea equilatero     
      y= 0.5*(y + sqrt(3));
      x=t;
      
%%esquina izquierda del triangulo
   elseif (d==2)
      t= 0.5*x;
      y= 0.5*y;
      x=t;     
  end

hold on;

plot(x,y,'*','color','g'); %%Este es el Helecho

pause(0.00000001)

endfor