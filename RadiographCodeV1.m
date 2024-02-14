
% Luis Angel Gonzalez A01571007

%% 
f=imread('radiograph1.jpg');
imshow(f);

f=f(:,:,1);

f=double(f)/255; 
%evita degradacion y problemas numericos

f=imresize(f,0.25);
% muestreo 4

figure(1);
subplot(2,2,1); 
imshow(f,[]);

subplot(2,2,2)
mesh(f) 
%Imagen

%%

h=10*fspecial("disk",10);
h=10*fspecial('gaussian',10); 
%distorcion del equipo
subplot(2,2,3);
limshow(h,[])
mesh(h);

% disco en la imagen PSF
g=conv2(f,h, "same"); 
subplot(2,2,4)
mesh(g);
imshow(g,[]);

F=fft2(f,sz(1),sz(2));

subplot(2,2,4);
imshow(fftshift(log(abs(F))),[]);

%% 
sz=size(f);
f=zeros(sz(1));
f(int16(sz(1)/2),int16(sz(2)/2))=1;
f(int16(sz(1)/3),int16(sz(2)/2))=1;
f(int16(sz(1)/2),int16(sz(2)/3))=1;
subplot(2,2,2)
imshow(f,[])

h = fspecial("gaussian",7,2);
subplot(2,2,3);
mesh(h)

g = conv2(f,h,"same");
subplot(2,2,4);
imshow(g,[])
mesh(g)

%PSF muestra la distorcion de la figura de salida

%%
for (x=1:sz(1))
    for (y=1:sz(2))
        f(y,x)=sin(y*0.07)*sin(x*0.05);
    end
end

subplot(2,2,1)
imshow(f,[])


