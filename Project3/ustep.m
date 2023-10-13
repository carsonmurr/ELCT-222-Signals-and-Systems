function y = ustep(t)
% Unit step function
%
% ustep(t) = 0 if t < 0
% ustep(t) = 1 if t >= 0
y = (t>=0);
end