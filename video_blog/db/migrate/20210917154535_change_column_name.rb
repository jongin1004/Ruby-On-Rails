class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :post_id, :video_id
  end
end
