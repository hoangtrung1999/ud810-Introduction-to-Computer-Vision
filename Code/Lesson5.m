#{
% Find template 1D using normalize cross-correlation.
pkg load image;
function index = find_template_1D(t, s)
    % TODO: Locate template t in signal s and return index
    % NOTE: Turn off all output from inside the function before submitting!
    c = normxcorr2 (t, s);
    [maxValue rawIndex] = max(c);
    index = rawIndex - length(t) + 1;
endfunction


% Test code:
s = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
t = [1 1 0];
disp('Signal:'), disp([1:size(s, 2); s]);
disp('Template:'), disp([1:size(t, 2); t]);

index = find_template_1D(t, s);
disp('Index:'), disp(index);
#}

% Find template 2D
% WARNING: This gonna take a long time to run on big image.
pkg load image;

function [yIndex xIndex] = find_template_2D(template, img)
  c = normxcorr2(template, img);
  [yRaw xRaw] = find(c == max(c(:)));
  yIndex = yRaw - size(template,1) +1;
  xIndex = xRaw - size(template,2) +1;
endfunction

img = imread('pic4.jpg');
template = img(320:420, 320:420);
[y x] = find_template_2D (template, img);
disp([y x]);

%Plot where the template was found
colormap('gray'), imagesc(img);
hold on;
plot (x, y, 'r+', 'markersize', 16);
hold on;