class Comment < ActiveRecord::Base
  validates :user,  presence: true
  validates :body, presence: true

  belongs_to :publication, polymorphic: true
end
