#pingコマンド 
時間超過や宛先到達不能などのエラー原因が返される
ICMPエコー要求パケットを送信すると、応答パケットが返される

ping -c 送信回数（カウント）
ping -i 送信間隔(インターバル)
ping -n アドレスで表示（DNS）

#systemdのシステムでネットワークを設定するデーモン
systemd-networkd
設定
/etc/systemd/network


#ルーティングテーブル(デフォゲ)を表示（すべてにrouteのRが使われている）
ipコマンド
  ip route show
routeコマンド
netstatコマンド
  netstat -r

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
（例）数値（ネームサーバ）をドメイン（ドメイン）にする
nameserver 192.168.1.1
domain ping-t.com

#ブロードキャスト
全て1

#DNSを利用してホスト名をIPアドレスに変換できるコマンド
nslookup
getent
host
dig
#getentコマンド：名前解決の検索
/etc/nsswitch.confの設定に従い検索するコマンド

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
#NMの状態
      general status #NetworkManagerの状態を表示する
              hostname #ホスト名を設定できる
#ネットワーク
      networking connectivity #ネットワークの接続状態を表示できる
        full    ネットアクセス可能
				portal  ログインしないとネットアクセスできない
				limited ネットワークに接続しているが、ネットアクセスできない
				none    接続していない
				unknown 見つからない
#Wifi(ちょい名前が特殊)
			radio wifi  on/off  wifiの有効化無効化（接続させるまではdevice）
#接続状況
			connection  modify ID(接続IDの設定ファイルを変更する)
                  up/down (コネはupdown)
									show(接続状況を表示)
#デバイスの状況
			device      show(IPアドレスなどの詳細情報を表示)
			            status（デバイスの状態）
                  delete（ソフトウェアデバイスを削除）
                  modify インターフェイス(インターフェイスの設定ファイルを変更する)
									wifi connect(wifiにアクセスポイント接続のための作成コマンド)
									connect/disconnect(ネットワークデバイスの接続切断)
									list(Wifiアクセスポイントの表示)
									monitor(デバイスの監視)
#nslookup:DNSへ問い合わせ
ホスト名をIPアドレスに変更できる

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
20 FTP    データ
21 FTP    制御
23 TELNET 遠隔操作
25 SMTP   

#ipconfig：Windows環境

#ipコマンド（ipコマンドなので、経路＝viaが使用されている）
##デフォルトルートを削除する
ip route del default
ip route del default via 192.168.122.1

ip -s link show デバイス :-sオプションでバイト数などの統計情報を表示できる

ip addr        IPv4,IPv6アドレス
  ip addr show(ip a sh と省略できる)
ip link        ネットワークデバイス（インターフェイスのこと）
  ip link set eth0 up （インタフェイスの有効化）
	ip link show(ip a sh のように省略できない！！)
ip neighbor sh ARPキャッシュの内容を確認
ip route       ルーティングテーブル

#ifconfig(interface configuration)：Linux環境のネットワークインターフェースの情報の表示や設定
有線LAN・無線LANなどのインターフェイスにIPアドレス、サブネットマスクなどの設定ができる
ipコマンドに移行しようとするも難航している

IP     （IPアドレス）
subnet （サブネット）
up/down（インターフェース有効無効）
MTU     (転送量)

#netstat:有効なネットワーク接続や開いているソケットの情報等を表示（古い）
TCP/UDPを対象にして統計情報を示す
netstat    有効なネットワーク表示、ソケット情報表示
netstat -r ルーティングテーブ表示                (ルーティング)
netstat -i ネットワークインターフェースの統計情報(とうけiiii)
netstat -n DNS無しの表示

#ssコマンド:netstatの後継コマンド（新しい）
・ifconfig      インターフェイスの設定や表示
・routeコマンド ルーティングテーブルの設定
・arp
・netstat
上記コマンドなど旧来のネットワーク関連ユーティリティであるnet-toolsの代替として開発されたiproute2ユーティリティに含まれているコマンド

ss -a 全てのソケット表示
ss -n サービス名の名前解決をしない
ss -t TCPソケット表示
ss -u UDPソケット表示

#whois:ドメインの管理者所有者情報を表示

#dig:DNSサーバへ問い合わせ

#hostnameコマンド
ホストネームを一時的に変更

#設定ファイル
/etc/hostname          #Debianホスト名（恒久的に変更）
/etc/sysconfig/network #RedHatホスト名・ネットワーク機能・デフォげ
/etc/hosts             #IPアドレスとホスト名                       113.78.123.10  ping-t.com
/etc/nsswitch.conf     #名前解決の順序                             hosts:         filess dns
/etc/resolv.conf       #DNS指定                                    domain         ping-t.com
/etc/services          #サービス名とポート番号                     telnet         23/tcp


#サービスとポート番号の対応
#NetworkManager.動的にネットワークを管理する仕組み
#nmcliNetworkManagerを管理するためのコマンドライン
nmcli.connection-show...#接続状況を表示したい

#routeコマンド：デフォゲの設定を確認できる
netmask
default gw


#digコマンド・検索タイブ(オブションとは異なる)
mx  メール
ns  ネーム
soa ドメイン
txt テキスト