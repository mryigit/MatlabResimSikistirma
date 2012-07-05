% converts yuv data to rgb  (FW-04-03)

function dst = yuv2rgb(src)

% ensure this runs with yuv images as well as yuv triples
if(length(size(src)) > 2)
    
    % yuv image ([y] [u] [v])
    y = double(src(:,:,1));
    u = double(src(:,:,2));
    v = double(src(:,:,3));
    
elseif(length(src) == 3)
    
    % yuv triplet ([y, u, v])
    y = double(src(1));
    u = double(src(2));
    v = double(src(3));
    
else
    
    % unknown input format
    error('yuv2rgb: unknown input format');
    
end
    

% convert...
u = 2*u - 256;
v = 2*v - 256;

r = y + v;
g = floor(y - 0.51*v - 0.19*u);
b = y + u;

% ensure valid range for uint8 values
r(r > 255) = 255;
r(r < 0)   = 0;
g(g > 255) = 255;
g(g < 0)   = 0;
b(b > 255) = 255;
b(b < 0)   = 0;


% generate output
if(length(size(src)) > 2)
    
    % rgb image ([r] [g] [b])
    dst(:,:,1) = uint8(r);
    dst(:,:,2) = uint8(g);
    dst(:,:,3) = uint8(b);
    
else
    
    % rgb triplet ([r, g, b])
    dst = uint8([r, g, b]);
    
end