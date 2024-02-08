# frozen_string_literal: true

Kaminari.configure do |config|
  #1ページ当たりの表示件数
  config.default_per_page = 2
  
  #1ページ当たりの最大表示件数：いつ使うんか？
  # config.max_per_page = nil
  
  #前後何ページ分のボタンを設置するか
  # config.window = 4
  
  #最初と最後から何ページ分のボタンを設置するか
  # config.outer_window = 0
  
  #最初から何ページ分のボタンを設置するか：outer_windowの前側だけ
  # config.left = 0
  
  #最後から何ページ分のボタンを設置するか：outer_windowの後側だけ
  # config.right = 0
  
  #該当ページを取得する際などに使用するスコープの命名(Book.page()のpageの部分)
  # config.page_method_name = :page
  
  #ページを表すパラメータの命名(params[:page]で取得できる)
  # config.param_name = :page
  
  #最大ページ数：それを超えるページは表示されない
  # config.max_pages = nil
  
  #最初のページでparamsを無視する：何に使うんだ？
  # config.params_on_first_page = false
end
