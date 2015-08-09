clc;clear;
gt=load('mat/3063.mat');
gt5=cell(1,5)
for i=1:5
    %figure;
    str=strcat('jpg/',num2str(i),'.png');
    %str2=strcat('xls/',num2str(i),'.xls');
    im=uint8(gt.groundTruth{1,i}.Boundaries)*255;
    gt5{1,i}=im;
    %xlswrite(str2,im);
   % im=imshow(im);
    imwrite(im,str);
end

