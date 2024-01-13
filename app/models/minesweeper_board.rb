#MinesweeperApp/app/models/minesweeper_board.rb
class MinesweeperBoard < ApplicationRecord
  validates :email, presence: true, length: { maximum: 100 }
  validates :board_width, :board_height, presence: true, numericality: { greater_than: 0 }
  validates :num_mines, numericality: { less_than_or_equal_to: ->(board) { board.board_width * board.board_height } }
  validates :board_name, length: { maximum: 100 }
end
