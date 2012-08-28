class ApplicationController < ActionController::Base
    protect_from_forgery

    #--------------------------------------------------------------------------#
    # rowsPerPage 한 페이지당 표시될 게시물 수
    # 모든 컨트롤러에서 사용가능하게 여기에 정의한다.
    def rowsPerPage
        @rowsPerPage ||= 2
    end

end
