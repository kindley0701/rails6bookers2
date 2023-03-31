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