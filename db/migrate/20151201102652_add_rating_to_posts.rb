class AddRatingToPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :rating
    add_column :posts, :rating, :string
  end
end
