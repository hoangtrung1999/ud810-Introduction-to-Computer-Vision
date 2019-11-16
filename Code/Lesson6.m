pkg load image;
#{
%Gradient Image
im = imread('tiger.jpg');

filt = fspecial('sobel');

outim = imfilter (double(im), filt);
imagesc(outim);
colormap gray;
#}

img = double(imread('E:\Computer Vision\Udacity Course\ud810-Introduction-to-Computer-Vision\Course-Images\octagon.png'))/255.;
% Gradient Direction
imshow(img);

% Compute x, y gradients
[gx gy] = imgradientxy(img, 'sobel');

%gx, gy goes from [-4;4], so that the maximum value can be 8
%imshow((gx + 4)/8);
%imshow((gy + 4)/8));

%Obtain gradient magnitude and direction
[gmag gdir] = imgradient(gx, gy);

%gmag = sqrt(gx*gx + gy*gy)
%imshow(gmag / (4 * sqrt(2)));

%gdir = arctan (gy / gx)
figure, imshow ((gdir + 180.0) / 360.0);

%Find pixels with desired gradient direction
function result = select_gdir (gmag, gdir, mag_min, angle_low, angle_high)
      result = gmag >= mag_min && gdir >= angle_low && gdir <= angle_high;
endfunction

figure, imshow (select_gdir(gmag, gdir, 1, 30, 60))

