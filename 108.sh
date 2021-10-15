#メール(MTA)
sendmail
Postfix
exim(Devian系標準)

#sendmailコマンド
sendmail(どのMTAでも入力待ちになる)

#mailコマンドメール送信・受情を表示する
表示コマンド mail.受信メールの本先
→/var/spool/mail/に格納されている受信メールを表示

表示コマンドmailq(or.sendmail)送信待ちのメールが保存
+/var/spool/mqueue/

#メール設定
/etc/aliacesメールの転送先記載(別のメールアドレスに転送できる)
newaliases
上記設定後反映させるためのコマンド
##個別(一般ユーザ)
~/.forward

#ntpqコマンド
-p 一覧表示
-i 対話モード

#ntpdの設定ファイル
NTPサーバに定期定期に時刻情報を問い合わせて自身の時刻を修正してシステムクロックを
/etc/ntp.conf
restrict  ntpdへのアクセス制限
server    時刻を取得するサーバ指定
driftfile 自身の時刻のずれ

#クローニー(ntpdに変わるクライアント)
/etc/chrony.conf

server   時間を取得するNTPサーバを指定
peer     時間を取得するNTPサーバを指定(同じ階層)
pool     時間を取得するNTPサーバをDNSラウンドロビン(集約した名前を指定する設定)
rtcsyunc 定期的にシステムクロックをハードウェアクロックに反映させる
rtc=リアル・タイム・クロック
driftfile自身の時刻のずれを記録するファイルを指定

#chronycコマンド(chronydを管理できる)
acrivity NTPサーバの数
sources 時刻のソース
sourcestats 時刻のソースの統計
tracking 時刻同期の詳細情報

#dateコマンド(システムクロ参・定)示・設定す
2010年7月20日19時30分28秒
date 872019302010.20(任意の形式で日付時刻を表示する

#ハードウェアクロック参照
hwclock -r表示
hwclock -s(hcto sys)ハードをシステムに反映
hwclock -w(sys to hc)システムをハードに反映

#journalctlコマンド
-a // --all                     表示不可も含め全ログ出力
-f // --follow                  リアルタイム出力
-l // --full                    表示可能な全ログ出力
-n(デフォ10行) //  --lines 10   最新10行のログを出力
-r // --reverse                 ”古い”の逆に出力（新しい順）

#systemd-journald 設定ファイル
  /etc/systemd/journald.conf
バイナリ形式ログの保存先
  /run/log/journal
systemd-machine-id-setupコマンドを押下すると、バイナリから通常（.log?）に変換
  /etc/machine-id


#ファシリティ（サーバ、クライアントなどの他？は収集できない）
auth,authpriv  認証
daemon         デーモン
kern           カーネル
lpr            印刷
mail           メール
syslog         syslog
user           ユーザアプリ
local0~7       独自に設定可能

##検索条件
journalctl _PID=100 プロセス番号
journalctl _UID=0   ユーザID
journalctl _SYSTEMD_UNIT=UNIT名 ユニット名指定

#timedatectlコマンド
status          現在の状態表示
set-ntp         NTPによる時刻同期を認めるか（yes | no）
set-time        日付の設定
set-timezone    タイムゾーンの設定
list-timezones  一覧（だから複数形）

#プリンタ印刷コマンド
lpr  ジョブ作成・プリント登録
lprm ジョブ削除
lpq  ジョブ一覧

#CUPSプリンタ印刷コマンド（新しくなったやつ）
IPP（インターネット・プリンティング・プロトコル）によってネットワークでプリンタできる

lp     ジョブ作成
cancel ジョブ削除
lpstat ジョブ一覧