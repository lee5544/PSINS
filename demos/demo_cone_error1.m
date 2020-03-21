% Several attitude updating methods are compared.
% See also  qrk4, btzrk4, qpicard, qtaylor, dcmtaylor, cnscl.
% Copyright(c) 2009-2017, by Gongmin Yan, All rights reserved.
% Northwestern Polytechnical University, Xi An, P.R.China
% 14/02/2017
glvs
[nn, ts, nts] = nnts(4, 0.01);  % subsamples & sampling interval
afa = 9.*glv.deg;              % half-apex angle
f = 1;  w = 2*pi*f;             % frequency
T = 60;                          % simulation time
t = (ts:ts:T)';
Ax = afa*sin(w*t); Ay = afa*cos(2*w*t);
wm = diff([Ax,Ay,Ax*0],1,1);
coef = wm2wtcoef(ts, nn);
len = length(wm); res = zeros(fix(len/nn), 6);
q1 = [1;0;0;0]; q2 = q1; ki = 1;
for k=1:nn:len-nn+1
    k1 = k+nn-1;
	wmi = wm(k:k1, :);
	phim = cnscl(wmi, 1);  q1 = qmul(q1,rv2q(phim)); % optimal method
    q2 = qmul(q2, qpicard(wmi'*coef, nts));
	res(ki,:) = [q2att(q2);qq2phi(q1,q2)]';  ki = ki+1;
end
figure
t = (1:size(res,1))*nts;
plot(t, res(:,1:3)/glv.deg);
subplot(131), plot(t, res(:,4)/glv.sec), xygo('\phi / \prime\prime');
subplot(132), plot(t, res(:,5)/glv.sec), xygo('\phi / \prime\prime');
subplot(133), plot(t, res(:,6)/glv.sec), xygo('\phi / \prime\prime');