include Orderable

class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy #if the article is deleted associated comments are deleted as well
end
