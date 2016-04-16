class AddPublicationsToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :publication, index: true, polymorphic: true
  end
end
