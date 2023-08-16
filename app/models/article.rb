class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 140 }
  validates :text, presence: true, length: { maximum: 4000 }

  has_many :comments
  belongs_to :user, optional: true

  def subject
    title
  end

  def last_comment # метод возврата последнего комментария(Article.find(params[:id]).comments.last ??)
    comments.last # последний комментарий из колекции(видимо вообще всех комментов ??)
  end
end
