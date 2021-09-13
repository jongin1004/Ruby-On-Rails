class Article < ApplicationRecord
    # 첫 번째 유효성 검사는 title값이 있어야 한다고 선언합니다 
    # title은(는) 문자열 이므로 title값에 공백이 아닌 문자가 하나 이상 포함되어야 함을 의미합니다 .
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }    

    # 연결이 있는지 확인하려면 연결을 매핑하는 데 사용되는 외래 키가 아니라 연결된 개체 자체가 있는지 여부를 테스트해야 합니다. 
    # 이렇게 하면 외래 키가 비어 있지 않은지 확인할 뿐만 아니라 참조된 개체가 있는지도 확인할 수 있습니다.
    # has_one :account
    # validates :account, presence: true

    # 유효성 검사를 트리거하고 개체에서 오류가 발견되지 않으면 true를 반환하고 그렇지 않으면 false를 반환합니다.
    #invalid?의 역수입니다
    # Person.create(name: "John Doe").valid?
    # => true
    # Person.create(name: nil).valid?
    # => false

    #  errors[:attribute]. 에 대한 모든 오류 메시지의 배열을 반환합니다
    # Person.new.errors[:name].any?
    # => false
    # Person.create.errors[:name].any?
    # => true

    # acceptance 메서드는 양식이 제출될 때 사용자 인터페이스의 확인란이 선택되었는지 확인합니다
    # validates :terms_of_service, acceptance: true
    # message옵션을 통해 사용자 정의 메시지를 전달할 수도 있습니다.
    # validates :terms_of_service, acceptance: { message: 'must be abided' }
    # 또한 :accept허용된 것으로 간주될 허용된 값을 결정 하는 옵션 을 받을 수도 있습니다. 기본값으로 설정 ['1', true]되어 있으며 쉽게 변경할 수 있습니다.
    # validates :terms_of_service, acceptance: { accept: 'yes' }
    # validates :eula, acceptance: { accept: ['TRUE', 'accepted'] }


    # 정확히 동일한 내용을 수신해야 하는 두 개의 텍스트 필드가 있는 경우 이 도우미를 사용해야 합니다.
    # validates :password, :presence =>true, :confirmation =>true
    # validates_confirmation_of :password

    # <%= form_for(@user) do |f|%>
    #     <% if @user.errors.any? %>
    #         ....
    #         ....
    #     <% end %>
    #     <%= f.label :email %><br />
    #     <%= f.text_field :email %><br />
    #     <%= f.label :password %><br />
    #     <%= f.password_field :password %><br />
    #     <%= f.label :password_confirmation %><br />
    #     <%= f.password_field :password_confirmation %>
    #     <%= f.submit %>
    # <% end %>

    # exclusion도우미는 속성 값이 지정된 집합에 포함되어 있지 않은지 확인합니다. 사실, 이 집합은 모든 열거 가능한 개체가 될 수 있습니다.
    # validates :subdomain, exclusion: { in: %w(www us ca jp),
    # message: "%{value} is reserved." }

    # inclusion 도우미는 속성 값이 지정된 집합에 포함되어 있는지 확인합니다. 사실, 이 집합은 모든 열거 가능한 개체가 될 수 있습니다.
    # validates :size, inclusion: { in: %w(small medium large),
    # message: "%{value} is not a valid size" }

    # format 도우미는 :with옵션을 사용하여 지정된 지정된 정규식과 일치하는지 테스트하여 속성 값의 유효성을 검사합니다 .
    # validates :legacy_code, format: { with: /\A[a-zA-Z]+\z/,
    # message: "only allows letters" }

    # length도우미는 속성 값의 길이를 확인합니다. 다양한 옵션을 제공하므로 다양한 방법으로 길이 제약 조건을 지정할 수 있습니다.
    # validates :name, length: { minimum: 2 }
    # validates :bio, length: { maximum: 500 }
    # validates :password, length: { in: 6..20 }
    # validates :registration_number, length: { is: 6 }

    #  :wrong_length, :too_long그리고 :too_short옵션 및 %{count}길이 제한에 해당하는 번호에 대한 자리 표시로 사용되는.
    #  :message옵션을 사용하여 오류 메시지를 지정할 수 있습니다 .
    # validates :bio, length: { maximum: 1000,
    # too_long: "%{count} characters is the maximum allowed" }

    # numericality도우미는 속성에 숫자 값만 있는지 확인합니다. 기본적으로 정수 또는 부동 소수점 숫자가 뒤에 오는 선택적 기호와 일치합니다.
    # 정수만 허용되도록 지정하려면 :only_integertrue로 설정하십시오 . 그러면 다음을 사용할 것입니다.
    # validates :points, numericality: true
    # validates :games_played, numericality: { only_integer: true }
    # 그 외의 옵션들
    # :greater_than- 값이 제공된 값보다 커야 함을 지정합니다. 이 옵션의 기본 오류 메시지는 "%{count}보다 커야 함" 입니다.
    # :greater_than_or_equal_to- 값이 제공된 값보다 크거나 같아야 함을 지정합니다. 이 옵션의 기본 오류 메시지는 "%{count}보다 크거나 같아야 함" 입니다.
    # :equal_to- 값이 제공된 값과 같아야 함을 지정합니다. 이 옵션의 기본 오류 메시지는 "%{count}와 같아야 함" 입니다.
    # :less_than- 값이 제공된 값보다 작아야 함을 지정합니다. 이 옵션의 기본 오류 메시지는 "%{count}보다 작아야 함" 입니다.
    # :less_than_or_equal_to- 값이 제공된 값보다 작거나 같아야 함을 지정합니다. 이 옵션의 기본 오류 메시지는 "%{count}보다 작거나 같아야 함" 입니다.
    # :other_than- 값이 제공된 값과 달라야 함을 지정합니다. 이 옵션의 기본 오류 메시지는 "%{count} 이외의 값이어야 함" 입니다.
    # :odd- true로 설정된 경우 값이 홀수여야 함을 지정합니다. 이 옵션의 기본 오류 메시지는 "홀수여야 합니다" 입니다.
    # :even- true로 설정된 경우 값이 짝수여야 함을 지정합니다. 이 옵션의 기본 오류 메시지는 "짝수여야 합니다" 입니다.

    # 부울 필드가 있는지 확인하려면 다음 확인 중 하나를 사용해야 합니다.
    # validates :boolean_field_name, inclusion: [true, false]
    # validates :boolean_field_name, exclusion: [nil]

    # 메서드를 사용하여 값이 nil 또는 빈 문자열, 즉 비어 있거나 공백으로 구성된 문자열이 아닌지 확인합니다.
    # validates :name, :login, :email, absence: true

    # 유효성 검사가 발생하기 직전에 호출될 메서드의 이름에 해당하는 기호와 :if및 :unless옵션을 연결할 수 있습니다 . 이것은 가장 일반적으로 사용되는 옵션입니다.
    # validates :card_number, presence: true, if: :paid_with_card?

    # def paid_with_card?
    #     payment_type == "card"
    # end

    # validates :password, confirmation: true, unless: -> { password.blank? }

    # 때로는 여러 유효성 검사에서 하나의 조건을 사용하는 것이 유용합니다. 를 사용하여 쉽게 달성할 수 있습니다 with_options.
    # with_options if: :is_admin? do |admin|
    #     admin.validates :password, length: { minimum: 10 }
    #     admin.validates :email, presence: true
    # end
end
