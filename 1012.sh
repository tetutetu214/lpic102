#pingコマンド
ping -c 送信回数（カウント）
ping -i 送信間隔(インターバル)
ping -n アドレスで表示（DNS）

#ルーティングテーブルを表示
ipコマンド
routeコマンド
netstatコマンド

##traepathコマンド
宛先までの経路確認
PathMTU（MaximumTransmissionUnit(最大データ量)）確認できる
IPv4,IPv6に対応
  IPv4       IPv6
  ping      :ping6       到達可能か
  traceroute:traceroute6 経路確認
  tracepath :tracepath6  最大転送量
  
#IPアドレスとホスト名の対応記載ファイル:名前解決に用いられるテキストファイル
/etc/hosts
(例)
112.78.124.10 ping-t.com

/etc/resolv.conf:DNSサーバ
（例）
nameserver 192.168.1.1

#ブロードキャスト
全て1

#DNSを利用してホスト名をIPアドレスに変換できるコマンド
nslookup
getent
host
dig

#Netcat:TCP/UDP通信を手軽に行うことができるツール（接続の待ち受けが出来るので簡易サーバとしても利用可）
nc -l 指定したアドレス、ポート番号で接続の待ち受け
nc -p ポートを指定
(例)
  nc -p 50000 test-sv
nc -u UDPで動作

#tracerouteコマンド：リモートホストまでの通信経路を表示
(例)名前解決なし（途中経路のホストを全てIPアドレス表示）
traceroute -n yahoo.co.jp

#NetworkManagerによるネットワーク管理を行える、curses(カーシス)ベースのインタフェース
nmtui

##NetworkManagerで管理できるネットワークデバイス
bridge  異なるネットワーク
ethenet 有線
wifi    無線

#nmcliコマンド＝NetworkManagerを管理するためのコマンドラインインタフェース（CLI）
nmcli オブジェクト[コマンド]
      general status #NetworkManagerの状態を表示する
      networking connectivity #ネットワークの接続状態を表示できる
        full    ネットアクセス可能
				portal  ログインしないとネットアクセスできない
				limited ネットワークに接続しているが、ネットアクセスできない
				none    接続していない
				unknown 見つからない
			radio
			connection  modify ID(接続IDの設定ファイルを変更する)
			device      show(IPアドレスなどの詳細情報を表示)
                  delete（ソフトウェアデバイスを削除）
                  modify インターフェイス(インターフェイスの設定ファイルを変更する)
									wifi connect(wifiにアクセスポイント接続のための作成コマンド)


#digコマンド：DNSへ直接問い合わせ（DNSに関するデバッギングツール）
  DNSサーバから詳細な情報
  DNSサーバへの登録情報

dig a   IPアドレス
dig any 全ての情報
dig mx  メールサーバ
dig ns  ネームサーバ
dig soa ゾーン（ドメインの範囲）
dig txt テキスト情報

#hostコマンド：DNSへ直接問い合わせ
host -t 問い合わせる情報指定（a,mx,ns,any）
host -v 詳細な出力

(例)
host -t mx yahoo.co.jp

#ウェルノウンポート
23 TELNET
25 SMTP

#ipconfig：Windows環境
#ifconfig(interface configuration)：Linux環境のネットワークインターフェースの情報の表示や設定
IP     （IPアドレス）
subnet （サブネット）
up/down（インターフェース有効無効）
MTU     (転送量)

#ipコマンド（ipコマンドなので、経路＝viaが使用されている）
##デフォルトルートを削除する
ip route del default
ip route del default via 192.168.122.1

ip -s link show デバイス :-sオプションでバイト数などの統計情報を表示できる

ip addr        IPv4,IPv6アドレス
ip link        ネットワークデバイス
ip neighbor sh ARPキャッシュの内容を確認
ip route       ルーティングテーブル

#netstat:有効なネットワーク接続や開いているソケットの情報等を表示
netstat    有効なネットワーク、ソケット情報
netstat -r ルーティングテーブ
netstat -i ネットワークインターフェースの統計情報
netstat -n DNS無しの表示

#whois:ドメインの管理者所有者情報を表示

#dig:DNSサーバへ問い合わせ

#ssコマンド:netstatの後継コマンド
・ifconfig      インターフェイスの設定や表示
・routeコマンド ルーティングテーブルの設定
・arp
・netstat
上記コマンドなど旧来のネットワーク関連ユーティリティであるnet-toolsの代替として開発されたiproute2ユーティリティに含まれているコマンド

ss -a 全てのソケット表示
ss -n サービス名の名前解決をしない
ss -t TCPソケット表示
ss -u UDPソケット表示

#設定ファイル
/etc/hostname          #Debianホスト名
/etc/sysconfig/network #RedHatホスト名・ネットワーク機能・デフォげ
/etc/hosts             #IPアドレスとホスト名                       113.78.123.10  ping-t.com
/etc/nsswitch.conf     #名前解決の順序                             hosts:         filess dns
/etc/resolv.conf       #DNS指定                                    domain         ping-t.com
/etc/services          #サービス名とポート番号                     telnet         23/tcp