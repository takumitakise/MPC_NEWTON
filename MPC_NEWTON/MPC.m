%% MPC(���f���\������C�j���[�g���@�œ��͌Q�X�V)
function u = MPC( x_current, u, sys, con )
    for cnt=1:5
        u = u - calcJ( x_current, u ,sys, con) \ calcF( x_current, u ,sys, con );
    end
end