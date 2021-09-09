function im_q = quantize_colors(im, k)
% im_q = quantize_colors(im, k)
%
% Image color quantization using the k-means clustering. The pixel colors
% are at first clustered into k clusters. Color of each pixel is then set
% to the mean color of the cluster to which it belongs to.
%
% Input:
%   im        .. Image whose pixel colors are to be quantized.
%
%   k         .. Required number of quantized colors.
%
% Output:
%   im_q      .. Image with quantized colors.


% Convert the image from RGB to L*a*b* color space
cform = makecform('srgb2lab');
im = applycform(im, cform);


% YOUR CODE HERE
im_1 = size(im,1);
im_2 = size(im,2);
N = im_1 * im_2;
inds = randsample(N, 1000);
L = im(:,:,1);
a = im(:,:,2);
b = im(:,:,3);
sample = [ L(inds)' ; a(inds)' ; b(inds)'];
x = [L(:)'; a(:)'; b(:)'];
x = double(x);
[c, means, sq_dists] = k_means(double(sample), k, Inf);
for i = 1:N
    for j = 1:k
        v(j) = norm((means(:,j) - x(:,i)));
    end
        [val idx] = min (v);
        x(:,i) = means(:,idx);
end
L = x(1,:); a = x(2,:); b = x(3,:);
L = reshape(L,[im_1 , im_2]);
a = reshape(a,[im_1 , im_2]);
b = reshape(b,[im_1 , im_2]);

im_q(:,:,1) = L;
im_q(:,:,2) = a;
im_q(:,:,3) = b;
%im_q(inds') = means(c);
% Convert the image from L*a*b* back to RGB
cform = makecform('lab2srgb');
im_q = applycform(uint8(im_q), cform);
