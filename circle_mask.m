% Working Circle + Mask

eye = imread("eyesample7.jpg");
gs = im2gray(eye);
bw = im2bw(eye);

[centers,radii] = imfindcircles(gs,[15 375],'ObjectPolarity','dark')
figure(1)
imshow(eye)
viscircles(centers,radii)

% Mask operatoion 
% Create a binary mask of the iris
mask = zeros(size(eye,1), size(eye,2));
[X,Y] = meshgrid(1:size(eye,2), 1:size(eye,1));
center = [centers(1,1), centers(1,2)]; % Center of the iris
radius = radii(1); % Radius of the iris
mask((X-center(1)).^2 + (Y-center(2)).^2 <= radius^2) = 1;

% Apply the mask to the original image
masked_image = uint8(zeros(size(eye)));
for i = 1:3
    masked_image(:,:,i) = eye(:,:,i) .* uint8(mask);
end

% Show the masked image
figure, imshow(masked_image);

