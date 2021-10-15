#useradd
useraddでオプションなしで作成した際の保存先
/etc/default/usradd

useradd -Dコマンドで上記パスを読み取り表示する

ASCII     7bit 128種類
ISO-8859  8bit 256種類
EUC-JP    UNIX
Shift_JIS Win/Mac
Unicode   符号化文字集合
  UTF-8

#crontab
ユーザ   /var/spol/cron/ユーザ
システム /etc/crontab
         /etc/cron.d

cp /usr/share/zoneinfo/XXXXX /etc/localtime
   バイナリ形式で格納        システムで利用したタイムゾーンをコピー（むろんバイナリ形式だ）
そのタイムゾーンを出力するために下記ファイルに記述
/etc/timezone

（例）タイムゾーンを日本(Asir/Tokyo)にしていることを確認
cat /etc/timezone
Asia/Tokyo

#getentコマンド：情報の問い合わせコマンド
/etc/nsswitch.conf 名前解決の順番

#ユニット
[Unit]
[Timer] = Timer作るときのしか利用しないユニット（＝固有のユニット）
OnBootSec=5mis
  .
	.
	.
[Install]

#groupmodコマンド:所属ユーザを変えることはできない
groupmod -g GID   GIDを変更
groupmod -n NAME  NAMEを変更