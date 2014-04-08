class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :user, :presence => true
  has_many :comments, as: :commentable
end
