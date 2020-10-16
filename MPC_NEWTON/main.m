%% 初期化
close all;
clear variables;
clc;

%% システム定義
sys.a = -1;     % システム変数
sys.b = -1;     % システム変数

%% シミュレーション定義
tsim = 50; % シミュレーション時間

%% コントローラ―定義
con.samplingPeriod = 0.1;           % サンプリング周期
con.tf = 1.0;                        % 予測時間
con.dv = 10;                         % 予測時間の分割数

con.x0 = [20;0];                      % コントローラに与える初期状態
con.u0 = [1;1;1];                      % コントローラに与える初期状態

con.q = [ 10;10 ];                     % 状態に対する重み
con.r = [ 1;1 ];                     % 入力に対する重み
con.sf = [ 10;10 ];                    % 予測時間の最終状態に対する重み

con.umax = 0.5;                        % 入力上限

con.len_x = length( con.x0 );        % 状態の数
con.len_u = length( con.u0 );        % 入力の数
con.len_lmd = con.len_x;             % 随伴変数の数

x = con.x0;                          % 初期値
u = repmat(con.u0,con.dv,1);    % 初期入力群

%% 格納配列
U = zeros( tsim/con.samplingPeriod ,con.len_u );
X = zeros( tsim/con.samplingPeriod ,con.len_x );
Time = zeros( tsim/con.samplingPeriod ,1 );

%% 積分
tic
for cnt=1:tsim/con.samplingPeriod
    u = MPC( x, u, sys, con );  % 入力群獲得
    x = x + func( x, u((1:con.len_u)), sys ) * con.samplingPeriod;  % 状態量更新
    U(cnt,:) = u((1:con.len_u));    % 入力格納
    X(cnt,:) = x;    % 状態量格納
    Time(cnt,1) = cnt * con.samplingPeriod; % 時間格納
    toc
end

%% プロット
dataplot

%% アニメーション
anm