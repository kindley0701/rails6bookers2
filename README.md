# 課題7d
## 評価機能
### 要件と設計
Book投稿時に五段階評価できる
・投稿時の五段階評価フォーム：books/_form
・評価の表示：books/index，books/show，books/edit，users/show
・編集時の評価変更不可
  -編集時フォームは表示のみ：books/_form
  -DBの書き換え不可：未実装
  
# 課題8d
## 並び替え機能
### 要件と設計
本の並び替えができる．
・並び替え方法の選択肢の表示：books/index
・新着順と評価順の並び替え：books#index

# 課題9d
## タグ機能
### 要件と設計
本に１つのタグをつけることができる
・投稿時のフォームにタグを追加：books/_form
・タグ検索
  -文字列での検索：header
  -タグを選択して検索：books/_index，books/show
  -検索結果表示：search#search，search/search