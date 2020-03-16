function imu = imuclbt(imu, Kg, eb, Ka, db, Ka2)
% SIMU calibration:
%    wm = Kg*wm - eb*ts.
%    vm = Kg*vm - db*ts - Ka2*vm.^2.
%
% Prototype: imu = imuadderr(imu, imuerr, ts)
% Inputs: imu - raw SIMU data = [wm, vm, t]
%         Kg/eb/Ka/eb - calibration parameters
% Output: imu - output SIMU data after calibration
%
% See also  imuadderr, insupdate.

% Copyright(c) 2009-2019, by Gongmin Yan, All rights reserved.
% Northwestern Polytechnical University, Xi An, P.R.China
% 27/12/2019
    ts = diff(imu(1:2,end));
    drift = [eb; db]*ts;
    imu(:,1:6) = [imu(:,1:3)*Kg', imu(:,4:6)*Ka'];
    for k=1:6
        imu(:,k) = imu(:,k) - drift(k);
    end
    if nargin>5
        for k=4:6
            imu(:,k) = imu(:,k) - imu(:,k).^2*Ka2(k-3)/ts;
        end
    end
