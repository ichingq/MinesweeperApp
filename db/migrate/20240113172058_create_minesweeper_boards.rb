class CreateMinesweeperBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :minesweeper_boards do |t|
      t.string :email
      t.integer :board_width
      t.integer :board_height
      t.integer :num_mines
      t.string :board_name
      t.text :mines

      t.timestamps
    end
  end
end
