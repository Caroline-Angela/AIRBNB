class AddFlatIdToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :flat_id, :integer
  end
end
