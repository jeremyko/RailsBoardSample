class MyRailsBoardRowsController < ApplicationController
    include ApplicationHelper

    #RESTful

    # --------------------------------------------------------------------------------------------------
    # HTTP request  URI                           Action      Purpose
    # --------------------------------------------------------------------------------------------------
    # GET           /my_rails_board_rows          index       page to list all my_rails_board_rows
    # GET           /my_rails_board_rows/1        show        page to show my_rails_board_rows with id 1
    # GET           /my_rails_board_rows/new      new         page to make a new my_rails_board_rows
    # POST          /my_rails_board_rows          create      create a new my_rails_board_rows
    # GET           /my_rails_board_rows/1/edit   edit        page to edit my_rails_board_rows with id 1
    # PUT           /my_rails_board_rows/1        update      update my_rails_board_rows with id 1
    # DELETE        /my_rails_board_rows/1        destroy     delete my_rails_board_rows with id 1


    # <a href="/static_pages/about">About</a>
    # but that isn’t the Rails Way. For one, it would be nice if the URI for the about page were 
    # /about rather than /static_pages/about; moreover, Rails conventionally uses named routes, which involves code like
    # <%= link_to "About", about_path %>

    #--------------------------------------------------------------------------#
    def index

        # url = '/listSpecificPageWork?current_page=1&searchStr=None'
        # Rails.logger.debug "!!! index url: #{url}"     
        # redirect_to url       
        
        # 좀더 RESTful 
        @searchStr = 'None'
        @current_page = '1'
        @totalCnt = MyRailsBoardRow.all.count                  
        @totalPageList = getTotalPageList( @totalCnt, rowsPerPage)        
        @boardList = 
                MyRailsBoardRow.find_by_sql ["select ID,SUBJECT,NAME, CREATED_AT, MAIL,MEMO,HITS \
                    from MY_RAILS_BOARD_ROWS ORDER BY id desc limit %s offset 0", rowsPerPage ] 

        render 'listSpecificPageWork'
    end
    #--------------------------------------------------------------------------#
    def show
        # 내용보기
        @id = params[:id]
        @current_page = params[:current_page] 
        @searchStr= params[:searchStr] 
                
        # hits increase        
        MyRailsBoardRow.increment_counter(:hits, @id  )

        @rowData = MyRailsBoardRow.find(params[:id])      

        render 'viewWork'  
    end
    #--------------------------------------------------------------------------#
    def new
        # 새로운 게시물 생성, 명시적으로 view를 지정한다. (기본적으로 new.html.erb를 참조함)
        @rowData = MyRailsBoardRow.new 
        render 'show_write_form'
    end
    
    #--------------------------------------------------------------------------#
    def create
        # 글쓰기 등록
        # params.each do |key,value|
        #    Rails.logger.warn "Param #{key}: #{value}"
        # end
        # Parameters: {"utf8"=>"✓", "authenticity_token"=>"TZ80O75xu52E0S3MXA49uTEkOdDMJE38INMRDIuVZOU=", "my_rails_board_row"=>{"name"=>"ggg", "mail"=>"ggg", "subject"=>"ggg", "memo"=>"ggg"}, "commit"=>"등록"}

        @rowData = MyRailsBoardRow.new(params[:my_rails_board_row])
                
        if @rowData.save          
          redirect_to '/'
        else
          render 'show_write_form'
        end
    end
    
    #--------------------------------------------------------------------------#    
    # def edit
    #     # 내용 수정을 위해 내용 출력하기, 현재 사용안함. EditViaPostReq 사용
    #     # button_to 가 GET방식을 사용할수 없기 때문에.
    #     @id = params[:id]
    #     @current_page = params[:current_page]
    #     @searchStr = params[:searchStr] 
    #     @rowData = MyRailsBoardRow.find(params[:id])
    #     render 'update'
    # end

    #--------------------------------------------------------------------------#
    def update
        # 변경내용을 저장할때
        @id = params[:id]
        @current_page = params[:current_page]
        @searchStr = params[:searchStr] 
        
        # Update DataBase
        @rowData = MyRailsBoardRow.find(params[:id])      

        if @rowData.update_attributes(params[:my_rails_board_row])
            # Display Page => POST 요청은 redirection!
            url = '/listSpecificPageWork?current_page=' + @current_page+'&searchStr='+@searchStr
            redirect_to url     
        else
            render 'update'
        end        
    end
    #--------------------------------------------------------------------------#
    def destroy

        Rails.logger.debug "current_page: #{params[:current_page]}"     

        MyRailsBoardRow.find(params[:id]).destroy
        
        # 차이점        
        # my_rails_board_rows_path => '/my_rails_board_rows'
        # my_rails_board_rows_url  => 'http://localhost:3000/my_rails_board_rows' => full URI

        # redirect_to my_rails_board_rows_url
        redirect_to my_rails_board_rows_path
    end    
    #--------------------------------------------------------------------------#        
    # buton_to 를 사용하기 위해서 .. POST로 요청되기 때문..
    # edit action은 GET인 경우만 가능함..
    def EditViaPostReq                
        @id = params[:id]
        @current_page = params[:current_page]
        @searchStr = params[:searchStr] 

        @rowData = MyRailsBoardRow.find(params[:id])

        render 'update'
    end    
    #--------------------------------------------------------------------------#
    def searchWithSubject
        
        @searchStr = params[:searchStr]
                        
        url = '/listSpecificPageWork?searchStr=' + @searchStr +'&current_page=1'
        Rails.logger.debug "***** url:" + url
        
        uri = URI.encode(url.strip)         
        Rails.logger.debug uri
        
        redirect_to uri
    end    
    #--------------------------------------------------------------------------#
    def listSpecificPageWork
        
        @searchStr = URI.decode(params[:searchStr])   
        # @searchStr = params[:searchStr]
        Rails.logger.debug "listSpecificPageWork: @searchStr=" + @searchStr
        
        @current_page = params[:current_page]         
        
        Rails.logger.debug "!!! searchStr: #{@searchStr}"     
        
        # 페이지를 가지고 범위 데이터를 조회한다 => raw SQL 사용함
        # @boardList = MyRailsBoardRow.find_by_sql ["SELECT Z.* FROM(SELECT X.*, ceil( rownum / %s ) \ 
        #     as page FROM ( SELECT ID,SUBJECT,NAME, CREATED_AT, MAIL,MEMO,HITS \
        #         FROM MY_RAILS_BOARD_ROWS  ORDER BY ID DESC ) X ) Z WHERE page = %s", rowsPerPage, @current_page]  
                
        if @searchStr == 'None'
            @totalCnt = MyRailsBoardRow.all.count                  
            @totalPageList = getTotalPageList( @totalCnt, rowsPerPage)
            #sqlite3         
            @boardList = 
                MyRailsBoardRow.find_by_sql ["select ID,SUBJECT,NAME, CREATED_AT, MAIL,MEMO,HITS \
                    from MY_RAILS_BOARD_ROWS ORDER BY id desc limit %s offset %s", 
                    rowsPerPage, @current_page.to_i ==1 ? 0 : 2*(@current_page.to_i-1) ] 
        else
            # 검색처리
            @totalCnt = MyRailsBoardRow.where("subject LIKE ?","%#{@searchStr}%").count() 
            @totalPageList = getTotalPageList( @totalCnt, rowsPerPage)
            @boardList = 
                MyRailsBoardRow.find_by_sql [
            "select ID,SUBJECT,NAME, CREATED_AT, MAIL,MEMO,HITS from MY_RAILS_BOARD_ROWS where subject like '%%%s%%' ORDER BY id desc
             limit %s offset %s", @searchStr,rowsPerPage, @current_page.to_i ==1 ? 0 : 2*(@current_page.to_i-1) ] 
         end
    end
end
