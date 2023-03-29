# 課題8a
## DM機能の開発
### 要件と設計
相互フォロー時にDMができる
・初めてDMをする時にRoomを作成
  -DMのページを開くときにRoomがなければ新たに作成：messages#index(action)
  -相互フォローではないRoomではページを開いてもメッセージの送信ができない：messages#index(view)
・他人のusers#show，books#showで相互フォロー時にDMページへのボタンを表示：users#show(view)，books#show(view)
・メッセージ機能
  -メッセージの履歴を表示：messages#index(view)
  -メッセージ登録機能：messages#create
  -140文字制限：message.rb(model)
  -非同期化：messages/_form，messages/_table，messages/create