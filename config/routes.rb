# config/routes.rb

Rails.application.routes.draw do
  resources :minesweeper_boards, only: [:new, :create, :show, :index]

  # You can also set a root path to the new action:
  root 'minesweeper_boards#new'

  # Define the 'all_boards' route
  get '/all_boards', to: 'minesweeper_boards#all_boards', as: 'all_boards'

  # Define the 'all_generated_boards' route within the resources block
  resources :minesweeper_boards do
    collection do
      get 'all_generated_boards'
    end
  end
end
