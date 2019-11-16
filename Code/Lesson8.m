%Hough Demo
pkg load image;

%Apply Canny to find edges pixels
img = imread ('E:\Computer Vision\Udacity Course\ud810-Introduction-to-Computer-Vision\Course-Images\shapes.png');
grays = rgb2gray(img);
edges = edge(grays, 'canny');

%Apply Hough transform to find candidate lines
%Return accumulator array, theta, radious
[accum, theta, rho] = hough(edges);
figure, imagesc(accum),xlabel('xData'),ylabel('ydata'),title('Hough accumulator')

%Find peaks in the Hough accumulator matrix
%peaks = houghpeaks(accum, 100);
%Optimization: improve the result
peaks = houghpeaks(accum, 100, 'Threshold', ceil(0.6 * max(accum(:))), 'NHoodSize', [5 5]);

hold on;
plot(theta(peaks(:,2)), rho(peaks(:,1)),'rs');
hold off;

%Find lines(segments) in the image
line_segs = houghlines(edges, theta, rho, peaks, 'FillGap', 50, 'MinLength', 100);

figure, imshow(img), title('Line Segments');
hold on;

for k = 1:length(line_segs)
  endpoints = [line_segs(k).point1; line_segs(k).point2];
  plot(endpoints(:,1), endpoints(:,2), 'LineWidth', 2, 'Color', 'green');
endfor
hold off;

