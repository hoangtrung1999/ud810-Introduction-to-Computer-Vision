pkg load image;
im = imread ('pic1.jpg');
hsize = 31;
sigma = 5;

#{
%Create Filter
h = fspecial ('gaussian', hsize, sigma);

%Plot the filter as the surface
surf (h);

%Show the filter as the picture
imagesc (h);

%Apply the filter
outimg = imfilter (im, h);
imshow (outimg);

% Start from 1 to 10, step = 1
for sigma = 1:1:10
  h = fspecial ('gaussian', hsize, sigma);
  out = imfilter (im, h);
  disp(sigma);
  imshow (out);
  pause;
endfor
#}

%Removing noise using naive method

%Adding some noise

noise_sigma = 64;
noise = randn(size(im)) .* noise_sigma;
noise_img = im + noise;
imshow(noise_img);

%Apply Gaussian filter to smooth the noise
hsize = 31;
sigma = 5;

h = fspecial ('gaussian', hsize, sigma);
output = imfilter (noise_img, h);
imshow(output);


