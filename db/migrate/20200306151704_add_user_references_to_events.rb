class AddUserReferencesToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :creator, references: :user, foreign_key: true
  end
end
