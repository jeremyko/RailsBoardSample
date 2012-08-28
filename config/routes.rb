RailsBoard::Application.routes.draw do
   
    # You can have the root of your site routed with "root"
    # just remember to delete public/index.html.
    root :to => 'board#index'

    #REST-style URI
    #resources :my_rails_board_rows

    # 컨트롤러와 action을 mapping
    match '/show_write_form',  to: 'board#show_write_form'
    match '/DoWriteBoard',  to: 'board#DoWriteBoard'
    match '/viewWork',  to: 'board#viewWork'    
    match '/listSpecificPageWork',  to: 'board#listSpecificPageWork'
    match '/listSpecificPageWork_to_update',  to: 'board#listSpecificPageWork_to_update'        
    match '/updateBoard',  to: 'board#updateBoard'    
    match '/DeleteSpecificRow',  to: 'board#DeleteSpecificRow'    
    
    #search
    match '/searchWithSubject',  to: 'board#searchWithSubject'    
    match '/listSearchedSpecificPageWork',  to: 'board#listSearchedSpecificPageWork'
  
end

# REST-style URI
# HTTP    URI Action    Named   route                 Purpose
#-------------------------------------------------------------------------------------
# GET     /users        index   users_path            page to list all users
# GET     /users/1      show    user_path(user)       page to show user
# GET     /users/new    new     new_user_path         page to make a new user (signup)
# POST    /users        create  users_path            create a new user
# GET     /users/1/edit edit    edit_user_path(user)  page to edit user with id 1
# PUT     /users/1      update  user_path(user)       update user
# DELETE  /users/1      destroy user_path(user)       delete user
