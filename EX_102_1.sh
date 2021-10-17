#idコマンド
  ユーザのUID/GIDがわかる

#usermod/groupmod
  既存のアカウントの設定変更

-G プライマリ以外のグループに参加・不参加（どちらも同じコマンドでおこなう） 
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

#nmcliコマンド
device monitor デバイスを監視
device wifi list         アクセスポイントの表示
            connect SSID 接続デバイス作成・有効化
            rescan       再検索

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