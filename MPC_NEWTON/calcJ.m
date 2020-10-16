%% ヤコビ行列の計算
function J = calcJ( x_current, u ,sys, con )
    J = zeros( con.len_u * con.dv, con.len_u * con.dv );
    du = u / 100;
    for cnt = 1:con.len_u * con.dv
        J(cnt,cnt) = du(cnt);
        J(:,cnt) = J(:,cnt) + u;
        J(:,cnt) = ( calcF( x_current, J(:,cnt), sys, con ) - calcF( x_current, u, sys, con ) )/ du(cnt);
    end