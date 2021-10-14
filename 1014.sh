#定義済みのシェル関数を確認するコマンド
set
declare -f

set -o シェルのオプションを表示する

#環境変数の情報
env（環境変数を無くす系のコマンド）
-i            環境変数が設定されていない状態（1度に全て消す）
-u            一時的に環境変数をなしに       (undo消す)
環境変数名=値 一時的に値に変更する

##printenvコマンド：環境変数を表示する

シェルの特殊変数
$? 直前に実行されたコマンドの終了ステータス
$# 実行の際に指定された引数

#ログインシェル
/etc/profile
/.bash_profile
/.bash_login
/.profile

全ユーザに対して
/etc/bash.bashrc(Debian系)
/etc/bashrc     (RedHat系)

個別ユーザに対して
/.bashrc

#setコマンド
set noglob    正規表現無効
set noexec    読み込むけど実行しない
set noclobber ＞＜無し
set ignoreeof eof=最後の実行結果

#比較
gt >
lt <

#case文
case 値 in
  パターン1) 実行1 ;;
	パターン2）実行2 ;;
esac

#if文
if 条件 then
  実行1
else
  実行2
fi

#unsetコマンド
環境変数も削除する

#PWD :カレントディレクトリのパス
#PATH:コマンド・プログラムのディレクトリのリスト