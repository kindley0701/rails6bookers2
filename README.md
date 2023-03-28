# 課題9d
## タグ機能
### 要件と設計
本に１つのタグをつけることができる
・投稿時のフォームにタグを追加：books/_form
・タグ検索
  -文字列での検索：header
  -タグを選択して検索：books/_index，books/show
  -検索結果表示：search#search，search/search