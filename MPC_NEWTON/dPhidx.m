%% �֐��ӂ̏�Ԕ���
function Phix = dPhidx( x, con )
    Phix = [ x(1) * con.sf(1);x(2) * con.sf(2) ];
end