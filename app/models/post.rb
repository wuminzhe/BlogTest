class Post < ActiveRecord::Base
  validates :title,  presence: true
  validates :body, presence: true

  has_many :comments, ->{ order('created_at desc') }, dependent: :destroy, as: :publication
  has_many :taggings, as: :publication
  has_many :tags, through: :taggings

  def top3_comments
    self.comments.order('created_at desc').limit(3)
  end

  def tags_string
    tags.collect do |tag| tag.name end.join(', ')
  end
end
