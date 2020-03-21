function [m, q, u, s, v] = svdest(B)
% SVD ESTimator (SVDEST)
% Example: [m, q, u, s, v] = svdest(randn(3));
%
% See also  tr3, det3, inv3, adj3, svd3, foam, B33M44, quest, vortech, qrsvd

% Copyright(c) 2009-2020, by Gongmin Yan, All rights reserved.
% Northwestern Polytechnical University, Xi An, P.R.China
% 28/01/2020
    % assert(det(B)>0)
	[u, s, v] = svd(B);
    m = u*v';
    if nargout>=2, q = m2qua(m); end