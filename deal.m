% 利用掩膜图像去水印

clc
close all
clear all

for xx=1:439
file_name=['a (' num2str(xx) ').tif'];
file_store_name=['b (' num2str(xx) ').tif'];
im1=imread(file_name);
im=im1;
[m,n,k]=size(im);
for i=1:m-2
    for j=1:n-2
        for l=1:k
            if(im(i,j,l)==0&&im(i,j+1,l)==255&&im(i,j+2,l)==0&&im(i+1,j,l)==255&&im(i+1,j+1,l)==0&&im(i+1,j+2,l)==255&&im(i+2,j,l)==0&&im(i+2,j+1,l)==255&&im(i+2,j+2,l)==0)
                im1(i,j,l)=255;
                im1(i,j+1,l)=255;
                im1(i,j+2,l)=255;
                
                im1(i+1,j,l)=255;
                im1(i+1,j+1,l)=255;
                im1(i+1,j+2,l)=255;

                
                im1(i+2,j,l)=255;
                im1(i+2,j+1,l)=255;
                im1(i+2,j+2,l)=255;
                
            end
        end
    end
end
im=im1;
for i=2:m-1
    for j=2:n-1
        for l=1:k
            if(im(i,j,l)==0&&im(i+1,j,l)==255&&im(i-1,j,l)==255&&im(i,j+1,l)==255&&im(i,j-1,l)==255)
                im1(i,j,l)=255;
            end

           
        end
    end
end

imwrite(im1,file_store_name);

end



