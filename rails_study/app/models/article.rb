class Article < ApplicationRecord
    # 첫 번째 유효성 검사는 title값이 있어야 한다고 선언합니다 
    # title은(는) 문자열 이므로 title값에 공백이 아닌 문자가 하나 이상 포함되어야 함을 의미합니다 .
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }    
end
