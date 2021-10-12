#pingコマンド
ping -c 送信回数（カウント）
ping -i 送信間隔(インターバル)
ping -n アドレスで表示（DNS）

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

#Netcat:TCP/UDP通信を手軽に行うことができるツール（接続の待ち受けが出来るので簡易サーバとしても利用可）
nc -l 指定したアドレス、ポート番号で接続の待ち受け
nc -p ポートを指定
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
      general
      networking
			radio
			connection  modify(変更する)
			device      show(IPアドレスなどの詳細情報を表示)
                  delete（ソフトウェアデバイスを削除）

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

#ウェルノウンポート
23 TELNET
25 SMTP

#ipconfig：Windows環境
#ifconfig(interface configuration)：Linux環境
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


#ssコマンド:netstatの後継コマンド
・ifconfig
・route
・arp
・netstat
上記コマンドなど旧来のネットワーク関連ユーティリティであるnet-toolsの代替として開発されたiproute2ユーティリティに含まれているコマンド

ss -a 全てのソケット表示
ss -n サービス名の名前解決をしない
ss -t TCPソケット表示
ss -u UDPソケット表示