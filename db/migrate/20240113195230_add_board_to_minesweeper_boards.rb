class AddBoardToMinesweeperBoards < ActiveRecord::Migration[7.1]
  def change
    add_column :minesweeper_boards, :board, :text, default: [].to_yaml
  end
end
