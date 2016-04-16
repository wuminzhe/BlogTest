class Tagging < ActiveRecord::Base
  belongs_to :publication, polymorphic: true
  belongs_to :tag
end
