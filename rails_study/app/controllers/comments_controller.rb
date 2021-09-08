class CommentsController < ApplicationController
    def create
        @scaffold_blog = ScaffoldBlog.find(params[:scaffold_blog_id])
        @comment = @scaffold_blog.comments.create(comment_params)
        redirect_to scaffold_blog_path(@scaffold_blog)
    end

    def destroy
        @scaffold_blog = ScaffoldBlog.find(params[:scaffold_blog_id])
        @comment = @scaffold_blog.comments.find(params[:id])
        @comment.destroy
        redirect_to scaffold_blog_path(@scaffold_blog) 
    end
    private
    def comment_params
       params.require(:comment).permit(:comment) 
    end
end
