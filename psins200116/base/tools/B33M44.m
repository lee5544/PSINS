function [M, z, s, S] = B33M44(B)
% Used by QUEST
% example:
%    M = B33M44(randn(3));
%    M = B33M44(a2mat(randn(3,1)));
% See also  tr3, det3, inv3, adj3, svd3, foam, quest

% Copyright(c) 2009-2020, by Gongmin Yan, All rights reserved.
% Northwestern Polytechnical University, Xi An, P.R.China
% 28/01/2020

    s = trace(B); z = [B(3,2)-B(2,3); B(1,3)-B(3,1); B(2,1)-B(1,2)]; S = B+B';
    M = [s, z'; z, S-s*eye(3)];
%     M = [ B(1,1)+B(2,2)+B(3,3),-B(2,3)+B(3,2),       -B(3,1)+B(1,3),       -B(1,2)+B(2,1);
%          -B(2,3)+B(3,2),        B(1,1)-B(2,2)-B(3,3), B(1,2)+B(2,1),        B(1,3)+B(3,1);
%          -B(3,1)+B(1,3),        B(1,2)+B(2,1),        B(2,2)-B(1,1)-B(3,3), B(2,3)+B(3,2);
%          -B(1,2)+B(2,1),        B(1,3)+B(3,1),        B(2,3)+B(3,2),        B(3,3)-B(2,2)-B(1,1) ];

%     ee = eig(M);
%     x = min(ee)-0.2:0.1:max(ee)+0.2;
%     y = x;
%     for k=1:length(x)
%         y(k) = det(x(k)*eye(4)-M);
%     end
%     plot(x, y, '-', ee, ee*0, 'xr'); grid on; hold on; title(sprintf('%f',det(B)));
    