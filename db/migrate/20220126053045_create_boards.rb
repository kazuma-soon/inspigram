class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.references :user, null: false, foreign_key: true
      t.string :board_image

      t.timestamps
    end
  end
end
