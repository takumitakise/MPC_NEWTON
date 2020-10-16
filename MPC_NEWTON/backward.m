%% 随伴ベクトルの更新
function lmd = backward( x, u, sys, con )
    dt = con.tf / con.dv;
    lmd = zeros( con.len_lmd * con.dv, 1 );
    lmd((1:con.len_lmd)+con.len_lmd*(con.dv-1)) = dPhidx( x((1:con.len_x)+con.len_x*(con.dv-1)), con );
    for cnt = con.dv-1:-1:1
        lmd((1:con.len_lmd)+con.len_lmd*(cnt-1)) = lmd((1:con.len_lmd)+con.len_lmd*(cnt)) ...
                                                            + dHdx( x((1:con.len_x)+con.len_x*(cnt)), u, lmd((1:con.len_lmd)+con.len_lmd*(cnt)), sys, con ) * dt;
    end
end