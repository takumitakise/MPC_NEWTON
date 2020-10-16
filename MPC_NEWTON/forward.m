%% èÛë‘ó ÇÃçXêV
function x = forward( x_current, u, sys, con )
    dt = con.tf / con.dv;
    x = zeros( con.len_x * con.dv, 1 );
    x(1:con.len_x) = x_current;
    for cnt = 1 : con.dv-1
       x((1:con.len_x)+con.len_x*(cnt)) = x((1:con.len_x)+con.len_x*(cnt-1)) ...
                                                + func( x((1:con.len_x)+con.len_x*(cnt-1)), u((1:con.len_u)+con.len_u*(cnt-1)), sys ) * dt; 
    end
end