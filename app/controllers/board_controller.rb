class BoardController < ApplicationController

    # 모든 helper는 view에서는 사용가능하지만 controller 에서는 명시적으로
    # include 해줘야 한다.
    include ApplicationHelper

    #--------------------------------------------------------------------------#
    def index
        #@boardList = MyRailsBoardRow.all # 전부다 조회...                        
        #@boardList = MyRailsBoardRow.all(limit: rowsPerPage)

        # @boardList = MyRailsBoardRow.find(:all, :limit => rowsPerPage, :order=> 'created_at desc')        
        # @totalCnt = MyRailsBoardRow.all.count
        # @current_page = 1
        # @totalPageList = getTotalPageList(@totalCnt, rowsPerPage)

        url = '/listSpecificPageWork?current_page=1'
        redirect_to url        
    end

    #--------------------------------------------------------------------------#
    def show_write_form
        # 객체를 생성해서 전달하고, 데이터를 담아온다.
        #@rowData = MyRailsBoardRow.new
    end

    #--------------------------------------------------------------------------#
    def DoWriteBoard

        #params.each do |key,value|
        #    Rails.logger.warn "Param #{key}: #{value}"
        #end

        # GET parameter 방식,,
        # todo : REST 를 사용하는것으로 변경해보자
        @rowData = MyRailsBoardRow.new( name: params[:name], mail: params[:mail],
            subject: params[:subject], memo: params[:memo], hits:0)
                
        @rowData.save

        redirect_to '/'
    end

    #--------------------------------------------------------------------------#
    def viewWork
        @id = params[:id]
        @current_page = params[:current_page] 
        @searchStr= params[:searchStr] 

        # hits increase        
        MyRailsBoardRow.increment_counter(:hits, @id  )

        @rowData = MyRailsBoardRow.find(params[:id])        

    end

    #--------------------------------------------------------------------------#
    def listSpecificPageWork
        #Rails.logger.puts('current_page=',params[:current_page])
        @current_page = params[:current_page] 
        @totalCnt = MyRailsBoardRow.all.count       
        @totalPageList = getTotalPageList( @totalCnt, rowsPerPage)
        
        # 페이지를 가지고 범위 데이터를 조회한다 => raw SQL 사용함
        # @boardList = MyRailsBoardRow.find_by_sql ["SELECT Z.* FROM(SELECT X.*, ceil( rownum / %s ) \ 
        #     as page FROM ( SELECT ID,SUBJECT,NAME, CREATED_AT, MAIL,MEMO,HITS \
        #         FROM MY_RAILS_BOARD_ROWS  ORDER BY ID DESC ) X ) Z WHERE page = %s", rowsPerPage, @current_page]  

        #sqlite3         
        @boardList = 
            MyRailsBoardRow.find_by_sql ["select ID,SUBJECT,NAME, CREATED_AT, MAIL,MEMO,HITS \
                from MY_RAILS_BOARD_ROWS ORDER BY id desc limit %s offset %s", 
                rowsPerPage, @current_page.to_i ==1 ? 0 : 2*(@current_page.to_i-1) ] 
         
        # 0 : 1 page
        # 2 : 2 page
        # 4 : 3 page
        # 6 : 4 page
        # 8 : 5 page        
        # ...
    end

    #--------------------------------------------------------------------------#
    def listSpecificPageWork_to_update
        @id = params[:id]
        @current_page = params[:current_page]
        @searchStr = params[:searchStr] 
        @rowData = MyRailsBoardRow.find(params[:id])
    end
    
    #--------------------------------------------------------------------------#
    def updateBoard
        @id = params[:id]
        @current_page = params[:current_page]
        @searchStr = params[:searchStr] 
        
        # Update DataBase
        @rowData = MyRailsBoardRow.find(params[:id])        
        @rowData.update_attributes( mail: params[:mail],
            subject: params[:subject], memo: params[:memo])
        
        # Display Page => POST 요청은 redirection!
        url = '/listSpecificPageWork?current_page=' + @current_page
        redirect_to url        
    end

    #--------------------------------------------------------------------------#
    def DeleteSpecificRow
        @id = params[:id]
        @current_page = params[:current_page]

        MyRailsBoardRow.find(params[:id]).destroy
        
        url = '/listSpecificPageWork?current_page=' + @current_page
        redirect_to url        
    end
    
    #--------------------------------------------------------------------------#
    def listSearchedSpecificPageWork
        @searchStr = params[:searchStr]
        @pageForView = params[:pageForView]

        Rails.logger.debug "***** @searchStr:" + @searchStr + "/ pageForView:"+@pageForView
                
        @totalCnt = MyRailsBoardRow.where("subject LIKE ?","%#{@searchStr}%").count()
                        
        Rails.logger.debug "search totalCnt:" + @totalCnt.to_s

        @totalPageList = getTotalPageList( @totalCnt, rowsPerPage)        
        
        @boardList = 
            MyRailsBoardRow.find_by_sql [
        "select ID,SUBJECT,NAME, CREATED_AT, MAIL,MEMO,HITS from MY_RAILS_BOARD_ROWS where subject like '%%%s%%' ORDER BY id desc
         limit %s offset %s", @searchStr,rowsPerPage, @current_page.to_i ==1 ? 0 : 2*(@current_page.to_i-1) ] 
        
        Rails.logger.debug "search Result :" + @boardList.count.to_s             
        
    end

    #--------------------------------------------------------------------------#
    def searchWithSubject
        @searchStr = params[:searchStr]
        Rails.logger.debug "***** @searchStr:" + @searchStr
        
        url = '/listSearchedSpecificPageWork?searchStr=' + @searchStr +'&pageForView=1'
        redirect_to url
    end

end
