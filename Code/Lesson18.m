
pkg load image;

%Solution
function best_x = find_best_match(patch, strip)
    % TODO: Find patch in strip and return column index (x value) of topleft corner
    best_x = 0; % placeholder
    min_diff = Inf;
    
    for x = 1:(size(strip)(2) - size(patch)(2) + 1)
      other_patch = strip(:, x:(x+size(patch)(2) - 1));
      diff = sumsq((patch - other_patch)(:));
      if diff < min_diff
        min_diff = diff;
        best_x = x;
      endif
    endfor

endfunction


%My method
%Wrong but I dont know why
function best_x = find_best_match2(patch, strip)
    % TODO: Find patch in strip and return column index (x value) of topleft corner
    best_x = 1; % placeholder

    c = normxcorr2 (patch, strip);
    [yRaw xRaw] = find(c == max(c(:)));
    yIndex = yRaw - size(patch,1) +1;
    xIndex = xRaw - size(patch,2) +1;
    best_x = xIndex;
endfunction


% Test code:

%% Load images
left = imread('E:\Computer Vision\Udacity Course\ud810-Introduction-to-Computer-Vision\Course-Images\flowers-left.png');
right = imread('E:\Computer Vision\Udacity Course\ud810-Introduction-to-Computer-Vision\Course-Images\flowers-right.png');
%figure, imshow(left);
%figure, imshow(right);

%% Convert to grayscale, double, [0, 1] range for easier computation
left_gray = double(rgb2gray(left)) / 255.0;
right_gray = double(rgb2gray(right)) / 255.0;

%% Define image patch location (topleft [row col]) and size
patch_loc = [120 170];
patch_size = [100 100];

%% Extract patch (from left image)
patch_left = left_gray(patch_loc(1):(patch_loc(1) + patch_size(1) - 1), patch_loc(2):(patch_loc(2) + patch_size(2) - 1));
figure, imshow(patch_left);

%% Extract strip (from right image)
strip_right = right_gray(patch_loc(1):(patch_loc(1) + patch_size(1) - 1), :);
hold ("on");
figure, imshow(strip_right);

%% Now look for the patch in the strip and report the best position (column index of topleft corner)
best_x = find_best_match(patch_left, strip_right);
best_x2 = find_best_match2(patch_left, strip_right);

disp(best_x);
disp(best_x2);

patch_right = right_gray(patch_loc(1):(patch_loc(1) + patch_size(1) - 1), best_x:(best_x + patch_size(2) - 1));
figure, imshow(patch_right);