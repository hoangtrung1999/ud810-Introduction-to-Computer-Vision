pkg load image

% Detect the commond edges in 2 images
#{
img1 = imread ('E:\Computer Vision\Udacity Course\ud810-Introduction-to-Computer-Vision\Course-Images\froomer.png');
img2= imread ('E:\Computer Vision\Udacity Course\ud810-Introduction-to-Computer-Vision\Course-Images\frizzy.png');
imshow(img1);

%The input parameter must be a grayscale image
img1 = rgb2gray(img1);
img1 = edge (img1, "Canny");
imshow(img1);

img2 = rgb2gray(img2);
img2 = edge (img2, "Canny");
imshow(img2);

imshow(img1 & img2);
#}

lena = imread ('E:\Computer Vision\Udacity Course\ud810-Introduction-to-Computer-Vision\Course-Images\lena.png');
%figure, imshow(lena), title('Original image, color');

%Convert to monochrome (grayscale) 
lenaMono = rgb2gray(lena);
%figure, imshow(lenaMono), title('Original Image, monochrome');

%Make a Blur/Smooth version
h = fspecial ('gaussian', [11 11], 4);
lenaSmooth = imfilter(lenaMono, h);
figure, imshow(lenaSmooth), title('Smooth Image');

%Edge Detection Methods Implement

%Method 1
%Shift image to left by one pixel 
lenaL = lenaSmooth;
lenaL (:, [1:(end-1)]) = lenaL (:, [2:end]);
%Shift image to right by one pixel
lenaR = lenaSmooth;
lenaR (:, [2:end]) = lenaR (:, [1:(end-1)]);
lenaDiff = double (lenaR) - double (lenaL);
%figure, imshow (lenaDiff, []), title('Difference between right and left shifted images');

%Method 2
cannyEdges = edge(lenaMono, 'Canny');
figure, imshow(cannyEdges), title('Edges of original image');

cannyEdges = edge(lenaSmooth, 'canny');
figure, imshow(cannyEdges), title('Edges of smooth image');

%Method 3
logEdges = edge(lenaMono, 'log');
figure, imshow(logEdges), title('Laplacian of Gaussian');







