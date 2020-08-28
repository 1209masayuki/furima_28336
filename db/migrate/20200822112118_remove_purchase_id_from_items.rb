class RemovePurchaseIdFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :purchase_id, :integer
  end
end
