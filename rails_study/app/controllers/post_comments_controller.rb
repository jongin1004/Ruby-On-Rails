class PostCommentsController < ApplicationController
    def create
        comment = PostComment.new
        comment.comment = params[:comment]
        comment.post_id = params[:id]
        comment.save

        redirect_to "/show/#{params[:id]}"
    end

    def destroy
        @comment = PostComment.find(params[:id])
        @id = @comment.post_id
        @comment.destroy

        redirect_to "/show/#{@id}"
    end
end
