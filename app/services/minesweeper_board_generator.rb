#MinesweeperApp/app/services/minesweeper_board_generator.rb

class MinesweeperBoardGenerator
  # Initialize the Minesweeper board generator with width, height, and number of mines
  def initialize(width, height, num_mines)
    @width = width
    @height = height
    @num_mines = num_mines
  end

  # Generate a Minesweeper board with specified dimensions and random mine placement
  def generate_board
    # Create an empty board with specified dimensions
    board = Array.new(@height) { Array.new(@width, :empty) }

    # Randomly place mines on the board
    mine_positions = generate_mine_positions
    place_mines(board, mine_positions)

    board
  end

  private

  # Generate an array of unique random positions for mines
  def generate_mine_positions
    all_positions = (0...@width * @height).to_a
    mine_positions = all_positions.sample(@num_mines)
  end

  # Place mines on the board based on given mine positions
  def place_mines(board, mine_positions)
    mine_positions.each do |position|
      row = position / @width
      col = position % @width
      board[row][col] = :mine
    end
  end
end
