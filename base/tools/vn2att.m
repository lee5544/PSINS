function att = vn2att(vn, th, isfig)
% trans velocity to tracking attitude.
%
% Prototype: att = vn2att(vn)
% Input: vn - velocity in E/N/U direction
% Output: att - tracking attitude
%
% See also  vn2dpos.

% Copyright(c) 2009-2019, by Gongmin Yan, All rights reserved.
% Northwestern Polytechnical University, Xi An, P.R.China
% 21/12/2019
global glv
    if nargin<3, isfig = 0; end
    if nargin<2, th = 0.1; end
    vl = normv(vn(:,1:2));
    att = [atan2(vn(:,3), vl), vn(:,1)*0, atan2(-vn(:,1), vn(:,2)), vn(:,end)];
    idx = vl<th;
    att(idx,1:3) = 0;
    if isfig==1
        myfigure
        subplot(211), plot(vn(:,end), vn(:,1:3)); xygo('V');
        subplot(212), plot(att(:,end), att(:,1:3)/glv.deg); xygo('att');
    end