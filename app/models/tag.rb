class Tag < ActiveRecord::Base
  validates :name, presence: true

  has_many :taggings
  has_many :posts, through: :taggings, :source => :publication, source_type: 'Post'
  has_many :articles, through: :taggings, :source => :publication, source_type: 'Article'
end
