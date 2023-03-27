# 課題9a
## 閲覧数の集計
### 要件と設計
投稿ごとに閲覧数を集計する．
・閲覧数のカウント
  -ページを開くごとに１追加，1人につき1まで：books#show(action)
・閲覧数の表示：books#index，books#show，users#show