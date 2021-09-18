# Rails 사용에 유요한 Gem

## gem 'rails_db'
rails_db를 설치하게 되면, root URL뒤에 "rails/db"를 추가해주면, 시각적으로 DB를 관리할 수 있다. 
![image](https://user-images.githubusercontent.com/65009016/133880144-50e0db29-2d76-489f-9270-b50a5207cb41.png)


## gem 'devise'
devise는 로그인 관련팩이다.<br>
![image](https://user-images.githubusercontent.com/65009016/133880273-c641daf8-e18e-452a-a96e-3076b0058fda.png)<br>

devise를 설치하면 다양한 기능을 사용할 수 있는데, 자주 사용되는 것<br>
1. user_signed_in?  => 현재 로그인이 되어있는지 아닌지 확인할 수 있다. true / false <br>
2. current_user => 현재 로그인된 사용자의 id값을 반환<br>

rails generate devise:views 명령어를 사용하여, 로그인 관련 page를 수정도 할 수 있다. 

## gem 'rails-i18l'
rails의 언어팩을 바꿀 수 있다. 

설정방법은, application.rb 파일에서<br>
"config.i18n.default_locale = :ko"를 추가해주면 된다. 


## gem 'kaminari', :git => 'https://github.com/kaminari/kaminari'
pagination기능을 쉽게 구현할 수 있도록 도와주는 라이브러리

사용 방법은 우선 data를 가져오는 controller#index 부분에<br.
@videos = Video.page(params[:page]).per(4)<br>
per은 페이지마다 가져올 data의 수를 정해준다. 


index.html.erb<br>
<%= paginate @videos %>

### Theme 설정 
rails g kaminari:views bootstrap4

기본 kaminari에는 디자인이 없기 때문에, 새로운 theme를 추가해줘서 사용하면 이쁜 디자인 사용가능<br>
위에는 bootstrap4를 사용했는데, 다른 theme도 사용가능하다. 
![image](https://user-images.githubusercontent.com/65009016/133880640-a9e37a1a-fca3-4c0e-8740-21d3433da081.png)


