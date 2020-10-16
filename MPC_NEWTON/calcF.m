%% ä÷êîF(dh/du)ÇÃåvéZ
function F = calcF( x_current, u, sys, con )
    x = forward( x_current, u, sys, con );
    lmd = backward( x, u, sys, con );
    F = zeros( con.len_u * con.dv, 1 );
    for cnt = 1:con.dv
        F((1:con.len_u)+con.len_u*(cnt-1)) = dHdu(x((1:con.len_x)+con.len_x*(cnt-1)), ...
                                                    u((1:con.len_u)+con.len_u*(cnt-1)), ...
                                                    lmd((1:con.len_lmd)+con.len_lmd*(cnt-1)), sys, con );
    end
end