# 課題7c
## グループ機能
### 要件と設計
グループの作成
・グループの登録とオーナー登録：groups#new，groups#create，groups/new
・グループの更新(オーナーのみ)：groups#edit，groups/edit，groups#update，groups_controller
・グループ一覧ページ：users/index，groups/index，groups#index

# 課題8c
## グループ機能：参加と離脱
### 要件と設計
オーナー以外はグループに参加したり抜けたりできる．
・グループへの参加・離脱ボタンの表示：groups#show(view)
・参加処理・離脱処理：group_users_controller
・グループのメンバーの表示
  -メンバー一覧とメンバー数：group#index，group#show

# 課題9c
## グループ機能：アナウンス機能
### 要件と設計
オーナーはグループのメンバーに告知することができ，告知した際にメールを送信する．
・アナウンス画面へのリンク：groups#show
・アナウンス画面の作成
  -アナウンス一覧：groups#show
  -アナウンス作成フォーム：notices#new
  -アナウンス完了画面：notices#show
・メール機能
  -gmailと連携：config/environments/development
  -メール本文の作成：contact_mailer/send_when_owner_announce
  -メールを送信する機能の作成：contact_mailer，application_mailer
  -アナウンス時にメールを送信：notices#create