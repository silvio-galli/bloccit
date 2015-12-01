class AddRatingToTopics < ActiveRecord::Migration
  def change
    remove_column :topics, :rating
    add_column :topics, :rating, :string
  end
end
