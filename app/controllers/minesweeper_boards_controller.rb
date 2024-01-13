# MineSweeperApp/controllers/minesweeper_boards_controller.rb

class MinesweeperBoardsController < ApplicationController
  def new
    @minesweeper_board = MinesweeperBoard.new
  end

  def create
    @minesweeper_board = MinesweeperBoard.new(minesweeper_board_params)
    generator = MinesweeperBoardGenerator.new(@minesweeper_board.board_width, @minesweeper_board.board_height, @minesweeper_board.num_mines)

    if @minesweeper_board.valid?
      @minesweeper_board.board = generator.generate_board

      if @minesweeper_board.save
        redirect_to minesweeper_board_path(@minesweeper_board.id)
      else
        render :new
      end
    else
      render :new
    end
  end

  def show
    if params[:id] == 'all_generated_boards'
      redirect_to all_boards_path
    else
      @minesweeper_board = MinesweeperBoard.find(params[:id])
    end
  end

  def index
    @recent_boards = MinesweeperBoard.order(created_at: :desc).limit(10)
  end

  def all_boards
    @all_boards = MinesweeperBoard.all
  end

  def minesweeper_board_params
    params.require(:minesweeper_board).permit(:email, :board_width, :board_height, :num_mines, :board_name)
  end
end
