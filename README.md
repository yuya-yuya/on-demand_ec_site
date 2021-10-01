「転・点・展」
これはたくさんの人がそれぞれの旅の思い出をシェアすることができるサイトである。昨今、TwitterやInstagramなどのSNSが人気を博しているが、そこでは旅に限らず、日常の風景や雑談、芸能ネタなど様々なトピックで溢れている。このサイトではあくまで「旅」にフォーカスを当てて、人々の思い出や豆知識をシェアしてもらいたいと考える。 タイトルも紐解くと、「転」は様々な土地を転々とする、「点」は人を点と見て、それぞれの点が繋がって欲しいという思い、「展」はそれぞれの思い出などを展示、共有して欲しいという思いから命名。






Demo
このアプリケーションは管理者側とユーザー側で分離している。ユーザー側から管理者側のページは遷移できないようにネームスペースを分離。


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






Dependency
- PHP (>= 7.0)
- Laravel 6.0
- MySQL
- Bootstrap
- Heroku




Usage
- http://laravelmysql.herokuapp.com/ にアクセス
- デモユーザーでログイン(ヘッダーのハンバーガメニューを開くとログインボタンがあるのでそこからログイン)
- Mail: `test@test`
- Password: `password`
- また、管理者でログインするには http://laravelmysql.herokuapp.com/ にアクセスした後にurlに /admin/home をつけてログインページに遷移。
- Mail: `test@test`
- Password: `password`
-ユーザー側で新規投稿や投稿一覧やユーザー一覧を閲覧したり、管理者としてジャンルや都市名、ユーザー編集などをしてみてください。
