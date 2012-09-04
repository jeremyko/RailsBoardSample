RailsBoard::Application.routes.draw do
    #REST-style URI
    resources :my_rails_board_rows

    root :to => 'my_rails_board_rows#index'

    match '/listSpecificPageWork',  to: 'my_rails_board_rows#listSpecificPageWork'    
    match '/searchWithSubject',  to: 'my_rails_board_rows#searchWithSubject'        
    match '/EditAdditionalParams',  to: 'my_rails_board_rows#EditAdditionalParams'       
end


