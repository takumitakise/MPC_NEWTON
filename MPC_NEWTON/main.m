%% ������
close all;
clear variables;
clc;

%% �V�X�e����`
sys.a = -1;     % �V�X�e���ϐ�
sys.b = -1;     % �V�X�e���ϐ�

%% �V�~�����[�V������`
tsim = 50; % �V�~�����[�V��������

%% �R���g���[���\��`
con.samplingPeriod = 0.1;           % �T���v�����O����
con.tf = 1.0;                        % �\������
con.dv = 10;                         % �\�����Ԃ̕�����

con.x0 = [20;0];                      % �R���g���[���ɗ^���鏉�����
con.u0 = [1;1;1];                      % �R���g���[���ɗ^���鏉�����

con.q = [ 10;10 ];                     % ��Ԃɑ΂���d��
con.r = [ 1;1 ];                     % ���͂ɑ΂���d��
con.sf = [ 10;10 ];                    % �\�����Ԃ̍ŏI��Ԃɑ΂���d��

con.umax = 0.5;                        % ���͏��

con.len_x = length( con.x0 );        % ��Ԃ̐�
con.len_u = length( con.u0 );        % ���͂̐�
con.len_lmd = con.len_x;             % �����ϐ��̐�

x = con.x0;                          % �����l
u = repmat(con.u0,con.dv,1);    % �������͌Q

%% �i�[�z��
U = zeros( tsim/con.samplingPeriod ,con.len_u );
X = zeros( tsim/con.samplingPeriod ,con.len_x );
Time = zeros( tsim/con.samplingPeriod ,1 );

%% �ϕ�
tic
for cnt=1:tsim/con.samplingPeriod
    u = MPC( x, u, sys, con );  % ���͌Q�l��
    x = x + func( x, u((1:con.len_u)), sys ) * con.samplingPeriod;  % ��ԗʍX�V
    U(cnt,:) = u((1:con.len_u));    % ���͊i�[
    X(cnt,:) = x;    % ��ԗʊi�[
    Time(cnt,1) = cnt * con.samplingPeriod; % ���Ԋi�[
    toc
end

%% �v���b�g
dataplot

%% �A�j���[�V����
anm