# About 
本サイトはケーキを販売するECサイトです。
このサイトを構築した主な理由として、ECサイトの市場拡大があります。
これまでAmazonや楽天市場などのECサイトが広く使われていましたが、新型コロナウイルスの蔓延にて、店を開けられない小売店・飲食店のEC化、顧客側としては外に出られない・出かけても店がやっていないという状況の中で、お買い物のEC化が加速しました。
さらに、「電子商取引に関する市場調査の結果を取りまとめました」(2020年7月22日)によると、「令和元年の日本国内のBtoC-EC（消費者向け電子商取引）市場規模は、19.4兆円（前年18.0兆円、前年比7.65％増）に拡大しています。また、令和元年の日本国内のBtoB-EC（企業間電子商取引）市場規模は353.0兆円（前年344.2兆円、前年比2.5％増）に拡大しています。」とあります。つまり、コロナ が蔓延する前の段階から、その利便性によりECサイトの需要は高まっており、さらにコロナの蔓延がその流れを加速させたと言えます。
コロナ が蔓延終了後も、この流れは加速すると私は考えます。
そのような、社会の状況を鑑みて、今後、注文処理そなえたアプリケーションを構築したという経験は貴重なものとなるだろうと考え、自分の成長目的として作成しました。
なお、決済機能は実装しておりません。

# Demo
  - ホーム画面
<img width="1218" alt="スクリーンショット 2021-10-01 17 04 56" src="https://user-images.githubusercontent.com/68839987/135587763-66e44c50-cec0-4e9f-9119-2143b8a120c2.png">
ユーザーホーム画面。ヘッダーからログインや新規登録、商品一覧が見れます。ログインしていなくても、商品一覧や詳細は見れますが、注文はできません。



管理者側
管理者トップページ
スクリーンショット 2021-07-08 17 03 02
管理者側のトップページ。ユーザーやジャンル、都市名のリンク先を用意。


管理者ユーザー一覧
スクリーンショット 2021-07-08 17 05 51
管理者側のユーザー一覧。管理者特権で全てのユーザーの削除編集権限がある。


管理者都市名投稿一覧とジャンル投稿一覧
スクリーンショット 2021-07-08 17 08 05
スクリーンショット 2021-07-08 17 07 58
管理者側の都市名とジャンル一覧。また、それぞれの新規追加機能も同ページに実装。ユーザーは管理者が設定した都市名とジャンルから選択し、投稿することとなる。これにより管理者がサイトを管理しやすくなる。


管理者ネームスペース
スクリーンショット 2021-07-08 17 23 59
管理者側のURLをadminで実装。ユーザー側から管理者側へのリンク先はないので、URLを直打ちでログインするしかない。(セキュリティ対策)


ユーザー側
ユーザートップページ
スクリーンショット 2021-07-08 17 27 52
ユーザー側のトップページ。swiperでスライドを実装。管理者が設定したジャンルから選択。


ユーザー投稿一覧と詳細
スクリーンショット 2021-07-08 17 31 29
スクリーンショット 2021-07-08 17 31 36
ユーザー側の投稿一覧と詳細。投稿した本人のみ削除が可能。また、詳細画面には返信機能を実装。


ユーザー新規投稿
スクリーンショット 2021-07-08 17 31 36
ユーザー側の新規投稿画面。アカウントを作成しないと、新規投稿ができない。


ユーザ側のユーザー一覧
スクリーンショット 2021-07-08 17 38 31
ユーザ側のユーザー一覧画面。管理者側とは違い、アカウント作成者本人でないと、編集削除不可。


ユーザ削除確認画面
スクリーンショット 2021-07-08 17 41 07
ユーザ側のユーザー削除確認画面。削除する前に確認を挟むことで誤動作を防止。


ユーザーネームスペース
スクリーンショット 2021-07-08 17 43 54
ユーザー側のURLをuserで実装。ユーザー側と管理者側をこれで完全分離。






Features
スクリーンショット 2021-05-20 4 11 06






# Dependency
  - Ruby '2.6.6'(言語)
  - Ruby on Rails  '~> 5.2.6'(フレームワーク)
  - Docker(開発環境)
  - SQlite3(DB)
  - Heroku(デプロイ)
  - S3(デプロイ時画像保存先)

# Usage
  - http://laravelmysql.herokuapp.com/ にアクセス
  - デモユーザーでログイン(ヘッダーのハンバーガメニューを開くとログインボタンがあるのでそこからログイン)
  - Mail: `test@test`
  - Password: `password`
  - また、管理者でログインするには http://laravelmysql.herokuapp.com/ にアクセスした後にurlに /admin/home をつけてログインページに遷移。
  - Mail: `test@test`
  - Password: `password`
  -ユーザー側で新規投稿や投稿一覧やユーザー一覧を閲覧したり、管理者としてジャンルや都市名、ユーザー編集などをしてみてください。
