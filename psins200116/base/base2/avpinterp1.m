function avp = avpinterp1(avp, t, method)
% avp linear interpolation. 
%
% Prototype: avp = avpinterp(avp1, avp2, ratio)
% Inputs: avp1,avp2 - input avp at time 1 & 2
%         ratio - interpolated time ratio point
% Output: avp - interpolated avp
%
% See also  attinterp, interp1.

% Copyright(c) 2009-2014, by Gongmin Yan, All rights reserved.
% Northwestern Polytechnical University, Xi An, P.R.China
% 13/11/2019
    if ~exist('method', 'var'), method = 'linear'; end
    i1 = find(t>avp(1,end),1,'first');
    i2 = find(t<avp(end,end),1,'last');
    t = t(i1:i2);
    avp = [interp1(avp(:,end), avp(:,1:end-1), t, method), t];
    