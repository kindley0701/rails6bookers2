class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites
  has_many :view_counts, dependent: :destroy
  # has_many :favorited_users, through: :favorites, source: :user
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  validates :rate, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "body", "tag", "created_at", "updated_at"]
  end

  #検索方法ごとの分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end


  scope :created_day_before, -> (d) { where(created_at: d.day.ago.all_day) }


end
