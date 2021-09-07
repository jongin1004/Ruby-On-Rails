class BlogController < ApplicationController
    def index
        @posts = Post.all
    end

    def test
        @temp = "안녕하세요!"
        @check = false
    end

    # create액션은 저장역할만하고, 다른 view파일을 보여줄 필요가없음
    #redirect_to를 이용해서 다른 url로 보냄
    def create
        post = Post.new
        post.title = params[:title]
        post.description = params[:description]
        post.save

        redirect_to '/home'
    end

    def update
        @post = Post.find(params[:id])
        # @id = params[:id]
    end

    def updateAction
        post = Post.find(params[:id])
        post.title = params[:title]
        post.description = params[:description]
        post.save

        redirect_to '/home'
    end
end