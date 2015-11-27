class AddRatingIdToPostsAndTopics < ActiveRecord::Migration
  def change
    add_column :topics, :rating_id, :integer
    add_column :posts, :rating_id, :integer
  end
end
