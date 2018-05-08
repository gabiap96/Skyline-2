# each user can write article.
# Initial, the article have just a title and a intro (type text)
# afterward the user can add paragraphs, charts, table, galleries of photos and code/references
class Article < ApplicationRecord
  validates :title, presence: true
  validates :intro, presence: true
  validates :user_id, presence: true

  has_many :paragraphs, dependent: :destroy
  belongs_to :user
end