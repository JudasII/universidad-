a=imread('C:\Users\jua-d\OneDrive\Escritorio\a\ST.jpeg');
imshow(a);

b=rgb2gray(a);

[filas columnas]=size(b);
c=b;

for (i=1:filas-1)
   
   for (j=1:columnas-1)
  
     c(i,j)=b(i+1,j)-b(i,j)+b(i,j+1)-b(i,j);
    
   end
  
end

imshow(c);