# 課題7d
## 評価機能
### 要件と設計
Book投稿時に五段階評価できる
・投稿時の五段階評価フォーム：books/_form
・評価の表示：books/index，books/show，books/edit，users/show
・編集時の評価変更不可
  -編集時フォームは表示のみ：books/_form
  -DBの書き換え不可：未実装