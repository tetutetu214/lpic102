#メール(MTA)
sendmail
Postfix
exim(Devian系標準)
#sendmailコマンド
sendmail(どのMTAでも入力待ちになる)
#mailコマンドメール送信・受情を表示する
表示コマンド mail.受信メールの本先
→/var/spoo1/mail/に格納されている受信メールを表示
表示コマンドmailq(or.sendmail)送信待ちのメールが保存
+/var/spool/mqueue/

#メール設定
/etc/aliacesメールの転送先記載(別のメールアドレスに転送できる)
newaliases
上記設定後反映させるためのコマンド
##個別(一般ユーザ)
~/.forward

#ntpdの設定ファイル
NTPサーバに定期定期に時刻情報を問い合わせて自身の時刻を修正してシステムクロックを
/etc/ntp.conf
restrict・ntpdへのアクセス制限
server
時刻を取得するサーバ指定
driftfile自身の時刻のずれ

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
