class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy #if the article is deleted associated comments are deleted as well

  def in_order
    order(created_at: :asc)
  end

  def recent(n)
    in_order.endmost(n)
  end

  def endmost(n)
    all.only(:order).from(all.reverse_order.limit(n), Article)
  end
end
