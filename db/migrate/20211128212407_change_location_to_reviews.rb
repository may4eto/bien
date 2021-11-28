class ChangeLocationToReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :address, :text
    add_column :reviews, :address, :string
  end
end
