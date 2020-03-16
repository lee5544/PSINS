function val = gett(array, tk, mth)
% Get value at tk from array.
%
% Prototype: val = gett(array, tk, mth)
%
% See also  combinet, datacut.

% Copyright(c) 2009-2019, by Gongmin Yan, All rights reserved.
% Northwestern Polytechnical University, Xi An, P.R.China
% 11/12/2019
    if tk<array(1,end) || tk>array(end,end),
        error(' tk out of range. ');
    else
        if nargin<3, mth = 'nearest'; end
        val = interp1(array(:,end), array(:,1:end-1), tk)';
    end