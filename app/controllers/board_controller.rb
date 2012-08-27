class BoardController < ApplicationController

    # 모든 helper는 view에서는 사용가능하지만 controller 에서는 명시적으로
    # include 해줘야 한다.
    include ApplicationHelper

    ############################################################################
    def index
        #@boardList = MyRailsBoardRow.all # 전부다 조회...
        # @boardList = MyRailsBoardRow.all(limit: rowsPerPage) 
        # @totalCnt = MyRailsBoardRow.all.count
        # @current_page = 1 # 최초 화면이므로 1
        # @totalPageList = getTotalPageList( @totalCnt, rowsPerPage)

        url = '/listSpecificPageWork?current_page=1'
        redirect_to url        
    end

    ############################################################################
    def show_write_form
        # 객체를 생성해서 전달하고, 데이터를 담아온다.
        @rowData = MyRailsBoardRow.new
    end

    ############################################################################
    def DoWriteBoard

        #params.each do |key,value|
        #    Rails.logger.warn "Param #{key}: #{value}"
        #end

        # GET parameter 방식,,
        # todo : REST 를 사용하는것으로 변경해보자
        @rowData = MyRailsBoardRow.new( name: params[:name], mail: params[:mail],
            subject: params[:subject], memo: params[:memo], hits:0)
        
        #Rails.logger.puts('name=',params[:name])
        #Rails.logger.puts('mail=',params[:mail])
        #Rails.logger.puts('subject=',params[:subject])
        #Rails.logger.puts('memo=',params[:memo])

        @rowData.save

        redirect_to '/'
    end

    ############################################################################
    def viewWork
        @id = params[:id]
        @current_page = params[:current_page] 
        @searchStr= params[:searchStr] 

        # hits increase        
        MyRailsBoardRow.increment_counter(:hits, @id  )

        @rowData = MyRailsBoardRow.find(params[:id])        

    end

    ############################################################################
    def listSpecificPageWork
        #Rails.logger.puts('current_page=',params[:current_page])
        @current_page = params[:current_page] 
        @totalCnt = MyRailsBoardRow.all.count       
        @totalPageList = getTotalPageList( @totalCnt, rowsPerPage)

        #debug
        @totalPageList.each do |ele|
            Rails.logger.warn "***** element: #{ele}, class:" + ele.class.to_s #class:Fixnum            
        end
        Rails.logger.warn "***** @current_page class:" + @current_page.class.to_s #class:Fixnum         
        
        
        # 페이지를 가지고 범위 데이터를 조회한다 => raw SQL 사용함
        # @boardList = MyRailsBoardRow.find_by_sql ["SELECT Z.* FROM(SELECT X.*, ceil( rownum / %s ) \ 
        #     as page FROM ( SELECT ID,SUBJECT,NAME, CREATED_AT, MAIL,MEMO,HITS \
        #         FROM MY_RAILS_BOARD_ROWS  ORDER BY ID DESC ) X ) Z WHERE page = %s", rowsPerPage, @current_page]  

        #sqlite3
        # at home...
        @boardList = 
            MyRailsBoardRow.find_by_sql ["SELECT z.ID,z.NAME,z.SUBJECT,z.CREATED_AT,z.MAIL,z.MEMO,z.HITS FROM(SELECT X.*, \
                (CASE WHEN x.rowid %% %s> 0  THEN CAST (x.rowid / %s + 1 as int) ELSE CAST (x.rowid / %s as int) END) as page \
                FROM ( SELECT rowid,ID,SUBJECT,NAME, CREATED_AT, MAIL,MEMO,HITS \
                FROM MY_RAILS_BOARD_ROWS  ORDER BY ID DESC ) X) Z  WHERE page = %s", 
                rowsPerPage,rowsPerPage,rowsPerPage, @current_page]  

        Rails.logger.warn "rowData:" + @boardList.count.to_s

        @boardList.each do |rowData|            
            Rails.logger.warn "rowData id:" + rowData.attributes['id']             
            Rails.logger.warn "rowData name:" + rowData..attributes['name']
        end                
    end

    ############################################################################
    def listSpecificPageWork_to_update
        @id = params[:id]
        @current_page = params[:current_page]
        @searchStr = params[:searchStr] 
        @rowData = MyRailsBoardRow.find(params[:id])
    end
    
    ############################################################################    
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

    ############################################################################
    def DeleteSpecificRow
        @id = params[:id]
        @current_page = params[:current_page]

        MyRailsBoardRow.find(params[:id]).destroy
        
        url = '/listSpecificPageWork?current_page=' + @current_page
        redirect_to url        
    end
    
    ############################################################################
    def listSearchedSpecificPageWork

    end

end
