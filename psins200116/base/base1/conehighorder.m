function dphim = conehighorder(wm)
% Calculation of noncommutativity error using uncompressed coning algorithm.
% Ref. SongMin PhD thesis P47 tab.3.1.
%
% Prototype: dphim = coneuncomp(wm)
% Input: wm - gyro angular increments
% Output: dphim - noncommutativity error compensation vector
%
% See also  conepolyn, conetwospeed, conedrift, scullpolyn, cnscl.

% Copyright(c) 2009-2020, by Gongmin Yan, All rights reserved.
% Northwestern Polytechnical University, Xi An, P.R.China
% 22/01/2020
global hocoef
    if isempty(whos('global','hocoef'))
        load highordercoef.mat
    end
    n = size(wm,1);
    if n==2
        ij = hocoef.kij2(:,1:end-1); K2 = hocoef.kij2(:,end);
        ijk = hocoef.kijk2(:,1:end-1); K3 = hocoef.kijk2(:,end);
        ijkl = hocoef.kijkl2(:,1:end-1); K4 = hocoef.kijkl2(:,end);
    elseif n==3
        ij = hocoef.kij3(:,1:end-1); K2 = hocoef.kij3(:,end);
        ijk = hocoef.kijk3(:,1:end-1); K3 = hocoef.kijk3(:,end);
        ijkl = hocoef.kijkl3(:,1:end-1); K4 = hocoef.kijkl3(:,end);
    elseif n==4
        ij = hocoef.kij4(:,1:end-1); K2 = hocoef.kij4(:,end);
        ijk = hocoef.kijk4(:,1:end-1); K3 = hocoef.kijk4(:,end);
        ijkl = hocoef.kijkl4(:,1:end-1); K4 = hocoef.kijkl4(:,end);
    elseif n==5
        ij = hocoef.kij5(:,1:end-1); K2 = hocoef.kij5(:,end);
        ijk = hocoef.kijk5(:,1:end-1); K3 = hocoef.kijk5(:,end);
        ijkl = hocoef.kijkl5(:,1:end-1); K4 = hocoef.kijkl5(:,end);
    end
    dphim = zeros(1,3);
    for k=1:length(K2)
        dphim = dphim + K2(k)*cross(wm(ij(k,1),:), wm(ij(k,2),:));
    end
%         dphim = ...
%             232/315*cros(wm(3,:),wm(4,:)) +  46/105*cros(wm(2,:),wm(4,:)) + ...
%               18/35*cros(wm(1,:),wm(4,:)) + 178/315*cros(wm(2,:),wm(3,:)) + ...
%              46/105*cros(wm(1,:),wm(3,:)) + 232/315*cros(wm(1,:),wm(2,:));
    for k=1:length(K3)
        dphim = dphim + K3(k)*cross(wm(ijk(k,1),:), cross(wm(ijk(k,2),:), wm(ijk(k,3),:)));
    end
	for k=1:length(K4)
        dphim = dphim + K4(k)*cross(wm(ijkl(k,1),:), cross(wm(ijkl(k,2),:), cross(wm(ijkl(k,3),:), wm(ijkl(k,4),:))));
    end
 