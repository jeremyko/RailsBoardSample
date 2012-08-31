# 모델은 단수로..
class MyRailsBoardRow < ActiveRecord::Base
    attr_accessible :hits, :mail, :memo, :name, :subject

    # 20120831
    before_save { |rowData| rowData.mail = mail.downcase }

    validates :name,  presence: true, length: { maximum: 50 }
    validates :subject,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :mail, presence: true, format: { with: VALID_EMAIL_REGEX }
    validates :memo,  presence: true, length: { maximum: 200 }
end
