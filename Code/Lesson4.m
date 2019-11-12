pkg load image

%Load image
im = imread ('pic1.jpg');

#{
%Create Gaussian Filter
hsize = 25;
sigma = 5;
h = fspecial ('gaussian', hsize, sigma);

%Boundary issues

%Clip filter
%Result: black boundary
output_clipped = imfilter (im, h);

%Wrap around a.k.a circular
%Result: Boundarys have colors from the opposite sites.
output_circular = imfilter (im, h, 'circular');

%Copy Edge a.k.a replicate
%Result: good
output_replicate= imfilter (im, h, 'replicate');

%Reflect across edge a.k.a symmetric
%Result: good
output_symmetric = imfilter (im, h, 'symmetric');
imshow (output_symmetric);
#}

%Median Filter Example

%Add salt & pepper noise
noisy_img = imnoise(im, 'salt & pepper', 0.05);


%Add random noise
noise = randn(size(im)) .* 32;
noised_img = im + noise;

%Apply a median filter
%Only working with one single channel picture.
median_filtered1 = medfilt2(noisy_img);

median_filtered2 = medfilt2(noised_img);

multi = cat (4, noisy_img, median_filtered1, noised_img, median_filtered2);
montage (multi);



