#xorg.conf
設定の保存ディレクトリ(問題でディレクトリは？と問われている)
/etc/X11/xorg.conf.d
設定ファイル自体
/etc/X11/xorg.conf
エラーログ
~/.xsession-errors

セクション
ServerLayout 入出力デバイス(何で入力するか？)
Files        カラー・フォント
Module       組み込みモジュール
InputDevce   キーボード・マウス
monitor      モニター（Monitot0とかの設定）
Device       ビデオカード
Screen       ディスプレイの表示、画面サイズ

ディスプレイマネージャー:ログイン環境の準備を行う
・SysV    initが環境変数DISPLAYMANAGERを読み込み起動
・systemd display-manager.serviceとして起動する

GNOME GDM
KDE   KDM Kwin(ウィンドウマネージャ)
X.org XDM
設定ファイル
/etc/X11/xdm/
xdm-config XDMの設定ファイル
Xresources ログイン画面のデザイン
Xaccess    ホストからXDMへアクセス許可
Xsetup_0   実行されるスクリプト（表示画面、背景など）
Xsession   ログイン後に実行されるスクリプト

ウィンドウマネージャー
twm

1 startxコマンド
2 xinitコマンド
3 ~/.xinitrc
3 上記がない場合 /etc/X11/xinit/xinitrc
4 GNOMEなどのウィンドウマネージャを起動