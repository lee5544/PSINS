function xyz = pos2dplot(pos0, varargin)
% Multi-pos 2D trajectory plot.
%
% Prototype: xyz = pos2dplot(pos0, varargin)
% Inputs: pos0 - [lat, lon, hgt, t]
%         varargin - other pos parameter
% Onput: xyz - [x, y, hgt, t]
%          
% See also  inserrplot, kfplot, gpsplot, imuplot, pos2dxyz.

% Copyright(c) 2009-2014, by Gongmin Yan, All rights reserved.
% Northwestern Polytechnical University, Xi An, P.R.China
% 24/05/2015
    lat0 = pos0(1,1); lon0 = pos0(1,2);
    eth = earth(pos0(1,1:3)');
    myfigure
    plot(0, 0, 'rp'); hold on;
    xyz = [(pos0(:,2)-lon0)*eth.RMh, (pos0(:,1)-lat0)*eth.clRNh, pos0(:,3:4)];
    plot(xyz(:,1), xyz(:,2))
    if nargin>1 xy1 = xyz; xyz = []; xyz{1} = xy1; end
    if nargin>1
        clr = 'rmycgb';
        for k=1:length(varargin)
            pos0 = varargin{k};
            xyz{k+1} = [(pos0(:,2)-lon0)*eth.RMh, (pos0(:,1)-lat0)*eth.clRNh, pos0(:,3:4)];
            plot(xyz{k+1}(:,1), xyz{k+1}(:,2), clr(k));
        end
    end
    xygo('est', 'nth');
	legend(sprintf('%.2f, %.2f / DMS', r2dms(lat0),r2dms(lon0)));

