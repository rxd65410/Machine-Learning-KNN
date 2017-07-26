function ret = nn_classifier( tx,ty,x )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
min=1000000;
index = 0;
for i = 1 : size(tx, 1)
    dist = e_dist(x,tx(i,:));
    if dist < min
        min = dist;
        index=i;
    end    
end

ret=ty(index);

end

