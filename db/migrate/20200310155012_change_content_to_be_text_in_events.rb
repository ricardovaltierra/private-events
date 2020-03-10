class ChangeContentToBeTextInEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :content, :text
  end
end
