%% MPC(モデル予測制御，ニュートン法で入力群更新)
function u = MPC( x_current, u, sys, con )
    for cnt=1:5
        u = u - calcJ( x_current, u ,sys, con) \ calcF( x_current, u ,sys, con );
    end
end