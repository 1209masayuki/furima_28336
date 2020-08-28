class RemoveJudgeFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :judge, :boolean
  end
end
