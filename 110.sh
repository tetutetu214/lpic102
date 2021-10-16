#chageコマンド
-l          一般ユーザでも唯一操作できるオプション
-m(minimum) 最短日数
-M(Max)     最長日数
-I(Inacrive)ロックされるまでの日程
-W(Warning) 有効期限前の警告
-E(Expire)  有効期限を指定

chage -m 0 user1
→パスワード期間を最短0日で更新できる（いつでも更新ができる設定）

#inetd
TCPラッパー
設定パス
/etc/inetd.conf

使用頻度が高いものを常駐させて、低いものを都度呼び出し（資源節約）

#xinetd
TCPラッパー
設定パス
/etc/xinetd.conf 全体設定
/etc/xinetd.d    個別設定

#設定項目
bind/interfae  インターフェイスのIPアドレス
disable        サービスを無効化(無効化するなら =yes)
instances      サーバの最大機動プロセス数
log_type       ログの保存先
socket_type    サービスの接続タイプ

no_access      アクセス拒否 #アクセス制御なのに反対感がない！
only_from      アクセス許可

server         サーバへの絶対パス
server_args    起動の際の引数
user           起動するユーザ
wait           接続処理の設定
                マルチ  ：no (またなくていいからNo)
                シングル：yes(シングルで処理できないからYes)

#systemdで動作するシステム（xinetdではないシステム）
socketユニットを使用する

#sshコマンド
設定パス
(SSHクライアント＝自分)
/etc/ssh/ssh_config

SSHサーバのデーモンsshdの設定
設定パス
(SSHサーバ＝sshd側)
/etc/ssh/sshd_config
サーバ側：PermitRotLogin noすることでSSHログインが不可になる

ssh -l ユーザ名 ユーザ指定(login user)
ssh -p          ポート指定
ssh -i          秘密鍵ディレクトリ指定
ssh -o          オプション

ssh-keygen -t 暗号化
暗号方式
  rsa
	dsa
	ecdsa
	ed25519

##SSHサーバの公開鍵/秘密鍵(自分でなくて相手側)
/etc/ssh/

###ログインの流れ
・ホスト認証（接続先のSSHサーバが正しいか）：公開鍵方式
    SSH接続をする
		サーバの公開鍵を送付される
		ユーザの/~.ssh/known_hostsに格納されている公開鍵と比べる

・ユーザ認証（接続するSSHユーザは正しいか）：公開鍵方式
    事前準備：ssh-keygen(ユーザの公開鍵/秘密鍵作成)
              公開鍵をサーバに登録(~/.ssh/authorized_keys)
    接続    ：公開鍵を利用できるか問い合わせ、秘密鍵で署名をつくり送る
    
    ユーザ認証で利用する秘密鍵を指定する
      -i(IdentityFile)
      -o IdentityFile

##ポートフォワーディング:あるポートの通信を別のポートに転送する
SSHサーバを通って、他のサーバにアクセスできる
(例)
      自身のポート:相手先 ssh接続
ssh -L 8000:localhost:80 user@ssh-server


#gpgコマンド
--gen-key
--export/import
--list-keys
--sign           #ファイルに署名をする
--verify         #ファイルの署名を検証
-e               #公開鍵を利用して暗号化する

複合の場合はオプション無し

(例)インポートして、鍵を受け取ったか確認する
gpg --import
gpt --list-keys

認証を一定期間キャッシュするデーモンプログラム
gpg-agent

#lastコマンド
設定
/var/log/wtmp を参照してログインユーザの一覧表示

#ulimitコマンド:ユーザ・シェルのリソースを制限
オプション
-a(all)
-c(core)
-f(fille)
-u(user process)
-v(virtual memory)

#fuserコマンド：使用中のプロセスを検索、強制終了
-k(kill)      プロセスにSigKill
-m(mount)     マウント（DVD-ROMにアクセスしているプロセスなど検索）
-n(namespace) 名前空間（file,udp,tcp）
-u(user)      ユーザ
-v(verbose)   詳細

fuser -k -n tcp 65432(ポート番号)

#w/whoコマンド
/var/run/utmp を参照して、現在ログインしているユーザを特定する

#nmapコマンド
指定したホストのポートをネットワーク経由で確認（リモートのホストも可能）

#lsofコマンド:システムのリソースを使用しているプロセス情報を表示
特定のポートを使用しているプロセスなど、ローカルホストの状態を確認

#GnuPgに関連するファイル
関連ファイルのディレクトリ
~/.gnupg/