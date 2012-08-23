# 모델은 단수로..
class MyRailsBoardRow < ActiveRecord::Base
    attr_accessible :hits, :mail, :memo, :name, :subject
end
