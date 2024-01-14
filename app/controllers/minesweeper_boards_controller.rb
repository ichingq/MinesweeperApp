# app/controllers/minesweeper_boards_controller.rb

class MinesweeperBoardsController < ApplicationController
  # Action for rendering the form to create a new Minesweeper board
  def new
    @minesweeper_board = MinesweeperBoard.new
  end

  # Action for handling the creation of a new Minesweeper board
  def create
    # Initialize a new MinesweeperBoard instance with parameters from the form
    @minesweeper_board = MinesweeperBoard.new(minesweeper_board_params)
    
    # Create a MinesweeperBoardGenerator instance with specified dimensions
    generator = MinesweeperBoardGenerator.new(@minesweeper_board.board_width, @minesweeper_board.board_height, @minesweeper_board.num_mines)

    # Check if MinesweeperBoard instance is valid
    if @minesweeper_board.valid?
      # Generate and assign the Minesweeper board
      @minesweeper_board.board = generator.generate_board

      # Save the Minesweeper board to the database
      if @minesweeper_board.save
        # Redirect to the show page for the created Minesweeper board
        redirect_to minesweeper_board_path(@minesweeper_board.id)
      else
        # Render the new form if saving fails
        render :new
      end
    else
      # Render the new form with validation errors if the MinesweeperBoard is not valid
      render :new
    end
  end

  # Action for showing details of a Minesweeper board
  def show
    # Check if the 'all_generated_boards' parameter is present
    if params[:id] == 'all_generated_boards'
      # Redirect to the page displaying all generated boards
      redirect_to all_boards_path
    else
      # Find and assign the Minesweeper board with the specified ID
      @minesweeper_board = MinesweeperBoard.find(params[:id])
    end
  end

  # Action for displaying a list of the ten most recently generated Minesweeper boards
  def index
    # Retrieve and assign the ten most recent Minesweeper boards
    @recent_boards = MinesweeperBoard.order(created_at: :desc).limit(10)
  end

  # Action for displaying a list of all Minesweeper boards
  def all_boards
    # Retrieve and assign all Minesweeper boards
    @all_boards = MinesweeperBoard.all
  end

  # Strong parameters method for handling form input
  def minesweeper_board_params
    params.require(:minesweeper_board).permit(:email, :board_width, :board_height, :num_mines, :board_name)
  end
end
