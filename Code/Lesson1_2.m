%Load Image
im = imread ('pic1.jpg');
im2 = imread ('pic2.png');
im3 = imread ('pic3.jpg');

#{
% im (row 110 -> 310, columns 10 -> 160)
cropped = im (110:310, 10:160);

%Seperate Color Plane
im_red = im(:, :, 1);

%Add 2 images
sum = im/2 + im2/2;

%Multiply by a scalar
function test = scale (img, value)
    test = value .* img;
endfunction

%Blend
function output = blend (img1, img2, alpha)
    output = alpha * img1 + (1-alpha) * img2;
endfunction

%Gaussian Noise
noise = randn (size(im)) .* 0.5;
output = im + noise;

%Difference between 2 images
abs_dif = abs (im-im2);

%A better solution
pkg load image;
abs_dif2 = imabsdiff(im,im2);

%random vector
ran_numbers = randn([1 5]);
disp(ran_numbers);

%Gaussisan distribution
noise = randn([1 1000000]);
[n , x] = hist(noise, linspace(-3, 3, 21));
%disp ([x; n]);
plot (x, n); 


#}



