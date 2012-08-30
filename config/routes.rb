RailsBoard::Application.routes.draw do
   
    # You can have the root of your site routed with "root"
    # just remember to delete public/index.html.
    root :to => 'my_rails_board_rows#index'
    
    #More rails way!

    #REST-style URI
    resources :my_rails_board_rows

    match '/listSpecificPageWork',  to: 'my_rails_board_rows#listSpecificPageWork'    
    match '/searchWithSubject',  to: 'my_rails_board_rows#searchWithSubject'    
    match '/listSearchedSpecificPageWork',  to: 'my_rails_board_rows#listSearchedSpecificPageWork'

    #TEST
    match '/EditViaPostReq',  to: 'my_rails_board_rows#EditViaPostReq'    

    # 컨트롤러와 action을 mapping
    # match '/show_write_form',  to: 'board#show_write_form'
    # match '/DoWriteBoard',  to: 'board#DoWriteBoard'
    # match '/viewWork',  to: 'board#viewWork'    
    # match '/listSpecificPageWork',  to: 'board#listSpecificPageWork'
    # match '/listSpecificPageWork_to_update',  to: 'board#listSpecificPageWork_to_update'        
    # match '/updateBoard',  to: 'board#updateBoard'    
    # match '/DeleteSpecificRow',  to: 'board#DeleteSpecificRow'    
    
    # #search
    # match '/searchWithSubject',  to: 'board#searchWithSubject'    
    # match '/listSearchedSpecificPageWork',  to: 'board#listSearchedSpecificPageWork'
  
end


