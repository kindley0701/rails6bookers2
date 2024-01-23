# 課題7a
## いいねランキング
### 要件と設計
直近1週間でいいねが多い順に表示する
・いいね順に本を取得：books#index

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

# 課題9a
## 閲覧数の集計
### 要件と設計
投稿ごとに閲覧数を集計する．
・閲覧数のカウント
  -ページを開くごとに１追加，1人につき1まで：books#show(action)
・閲覧数の表示：books#index，books#show，users#show