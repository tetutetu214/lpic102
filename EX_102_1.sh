#idコマンド
  ユーザのUID/GIDがわかる

#groupsコマンド
  ユーザの所属するグループを表示


#usermod
  所属している内容についての変更
-L
-U
-g

#groupmod
  グループ名の変更、GIDの変更などのグループに対して
-g グループのID（GID）を変更する
-n グループ名を変更する

#useraddオプション
-c コメント
-g プライマリグループ設定
-s シェル

#envコマンド
-i 全て消す
-u(undo) 一度だけ

#timedetactlコマンド
systemdの動作におけるシステム時刻の設定
set-time  日付
set-itmezone タイムゾーンの設定
list-timezone タイムゾーンの一覧

xorg.conf
Monitor モニタータイプの設定
Screen  ディスプレイの設定

systemd-journaldデーモン(ログ管理)の設定ファイル
/etc/systemd/journald.conf

#NTPサーバのデーモン
ntpd あくまでサーバ側（/etc/ntp.conf）

#xinetd
log_type ログの出力先を記述（出力先は絶対パス）

各サービスの個別設定
(例)
/etc/xinetd.d/myservice
service myservice
{
	disable = yes
}
上記の場合だとサービスは起動しない
disable=無効 に yes=する

ホスト名
/etc/hostname          だいたい同じ文字数
/etc/sysconfig/network

/etc/hosts             これと間違える

#chronycコマンド
sources      時刻のソース
sourcesstats 時刻のソースの統計
tracking     時刻同期の詳細除法

/etc/nsswitch.con 名前解決順序
→上記設定から検索するコマンド「getendコマンド」

#useraddコマンド
/etc/default/useradd （デフォルトが前！順番を間違える）
→デフォルトで登録したユーザアッド（ユーザ名）

#digコマンド
a   IPアドレス
any すべての情報

#VNC(Virtual Network Computing)
Linux・Windowsなどの異なるOSでリモでできるアプリ

ifconfig(インターフェイスに対して、こうゆう機能だよと設定する)
IP
サブネット

#ntpqコマンド
-p 一覧表示
-i 対話モード（不思議だけど対話モードがある）
#ntpdateコマンド
あくまでNTPサーバで動作しているデーモン（ntpd）であり、このデーモンが時間を取得、反映させるわけではない。

#CUPS(印刷)
CUPS
IPP プロトコル
PPD 機種情報のファイル

cat/etc/cups/cupsd.conf    ポート番号などのソフト系
cat/etc/cups/printers.conf プリンター自体のハード系

#ログインシェル
全ユーザ（通常ファイル）
/etc/profile
各ユーザ(隠しファイル)
/.bash_profile
/.bash_login
/.profile
/.bashrc

#ログインシェルとは異なる対話型シェルの起動の際
/etc/bash.bashrc
/etc/bashrc
~/.bashrc

全ユーザ
/etc/bash.bashrc Debian系
/etc/bashrc      RedHat系

#nmcliコマンド
device monitor デバイスを監視
device wifi list         アクセスポイントの表示
            connect SSID 接続デバイス作成・有効化
            rescan       再検索
networking connectivity
            full   
            portal 
            limited 
            none    
            unknown 
#これと間違えていた！！
connection up/down

#crontabコマンド
-e 編集
-l 表示
-r 削除

#ファシリティ
daemon
kern
local0~7

#TCPラッパー
allowを先に確認
基本全て許可される

#set シェルのオプション機能
noglob(No Global) 正規表現NG
ignoreeof         Ctrl+ログアウトNG
noclobber         ＞＜演算子NG
noexec            実行NG

#Chrony(クローニー)
NTPサーバ/クライアントに代替するシステム

#ポート
20 FTP   ファイル転送
21 FTP
22 SSH    リモート操作（暗号化）
23 TELNET リモート操作（暗号なし）

#digコマンド
→DNSに設定している値を直接みる（中を見ても値で表記されている）
#whoisコマンド
→DNSに登録している会社の窓口（ドメイン登録者を日本語で）とかを確認できる

#xdmの設定ファイル
/etc/X11/xdm/

#エラー出力
~/.xsession-errors(ホームに隠しファイルといて出力される)

#groupdelコマンド グループアカウント自体の削除

#ルーティング
コマンドの出力詳細がわかる（2つは同じ）
route
netstat -r

コマンドの出力のみ（簡易的）
ip route show

#印刷ジョブ
lprm -PPrinterB 500(500というジョブ番号は数値のみで表示)

#ulimit
-a all(リソースの全て)
-c core
-f file
-u userprocess
-v virtual memory

#タイムゾーン
/usr/share/zoneinfo のタイムゾーン情報を
/etc/localtime      にコピー（ただしバイナリ）
/etc/timezone       上記をテキストファイルにして利用できるように設定

#journalctlコマンド
-D 指定したディレクトリのlogを表示
-b boot
-o output ログの出力を指定

#netstat  ネットワーク接続、ソケット情報（TCPなど）
#ifconfig インターフェイスの状態(部分)

#findコマンドの書式について
find / -perm +6000   SUID or  SGID
find / -perm -6000   SUID and SGID

SSHサーバ（sshd）
  /etc/ssh/sshd_config
SSHクライアント（ssh）
  /etc/ssh/ssh_config

#aliasコマンドの設定
alias rm='rm -i'(バッククオートNG)

#localeコマンド
locale    今の設定
locale -a 設定できる一覧

