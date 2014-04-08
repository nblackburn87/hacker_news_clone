class Comment < ActiveRecord::Base

  validates :content, :presence => true
  validates :user, :presence => true
  has_many :comments, as: :commentable
  belongs_to :commentable, polymorphic: true
end
