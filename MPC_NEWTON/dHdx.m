%% 関数Hの状態微分
function Hx = dHdx( x, u, lmd, sys, cgmres )
    Hx = [ ...
        sys.a * lmd(2) + cgmres.q(1) * x(1); ...
        sys.b * lmd(2) * u(1) + cgmres.q(2) * x(2) + lmd(1); ...
        ];
end