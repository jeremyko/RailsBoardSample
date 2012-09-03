RailsBoard::Application.routes.draw do
       
    root :to => 'my_rails_board_rows#index'
    
    #More rails way!

    #REST-style URI
    resources :my_rails_board_rows

    match '/listSpecificPageWork',  to: 'my_rails_board_rows#listSpecificPageWork'    
    match '/searchWithSubject',  to: 'my_rails_board_rows#searchWithSubject'        
    match '/EditViaPostReq',  to: 'my_rails_board_rows#EditViaPostReq'       
end


