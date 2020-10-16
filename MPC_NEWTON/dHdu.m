%% ŠÖ”H‚Ì“ü—Í”÷•ª
function Hu = dHdu( x, u, lamda, sys, con )
    Hu = [ ...
        con.r(1) * u(1) + sys.b * lamda(2) * x(2) + u(3) * ( 2 * u(1) - con.umax );
        2 * u(2) * u(3) - con.r(2);
        ( u(1) - ( con.umax / 2 ) )^2 + u(2)^2 - ( con.umax / 2 )^2;
        ];
end