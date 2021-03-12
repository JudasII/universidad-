hold off
x=1;
y=1;
t=0;

for i=1:100000;
d=randi([0,7]);
  
    if (d== 0)
      t= x*0.3;
      y= y*0.3;
      x=t;
    
    elseif (d==1)
      t= (x + 1)*0.3; 
      y= y*0.3;
      x=t;
      
   elseif (d==2)
      t= (x + 2)*0.3; 
      y= y*0.3;
      x=t;   
      
  elseif (d==3)
      t= x*0.3;
      y= (y + 1)*0.3;
      x=t; 
      
  elseif (d==4)
      t= (x + 2)*0.3;
      y= (y + 1)*0.3;
      x=t;
      
  elseif (d==5)
      t= x*0.3;
      y= (y + 2)*0.3;
      x=t;
      
  elseif (d==6)
      t= (x + 1)*0.3; 
      y= (y + 2)*0.3;
      x=t;
      
  elseif (d==7)
      t= (x + 2)*0.3;
      y= (y + 2)*0.3;
      x=t;
  end

hold on;

plot(x,y,'*','color','g'); 

pause(0.00000001)

endfor