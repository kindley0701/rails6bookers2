class Relationship < ApplicationRecord
  #belongs_to :userではフォロー，被フォローの区別がつかない．多:多の場合はこのようにする．
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'
end
