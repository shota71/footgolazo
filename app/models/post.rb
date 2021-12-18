class Post < ApplicationRecord
  validates :name, presence: true
  validates :user_id, presence: true
  validates :tag, presence: true
  validates :content, presence: true
end
