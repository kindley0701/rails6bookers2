class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :notices, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def join?(user) #group.join?で使うとそのグループにそのユーザーが参加しているか確認できる
    group_users.exists?(user_id: user.id) #exists?(カラム名: 値)でカラムがその値になっているレコードの存在確認
  end

end
