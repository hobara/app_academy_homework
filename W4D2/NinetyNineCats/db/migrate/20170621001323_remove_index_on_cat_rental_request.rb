class RemoveIndexOnCatRentalRequest < ActiveRecord::Migration[5.0]
  def change
    remove_index :cat_rental_requests, :cat_id
  end
end
