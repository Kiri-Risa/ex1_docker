class CommentsController < ApplicationController
    helper_method :post

    def create
        post
        if @post.comments.create(comment_params)
            redirect_to post_path(@post)
            flash[:notice] = "コメントを投稿しました"
        else
            render 'show'
            flash[:notice] = "コメントを投稿できませんでした"
        end
    end

    def destroy
        post
        @comment = @post.comments.find(params[:id])
        if @comment.destroy
            redirect_to post_path(@post)
            flash[:notice] = "コメントを削除しました"
        else
            render 'show'
            flash[:notice] = "コメントを削除できませんでした"
        end
    end

    private
        def comment_params
            params.require(:comment).permit(:body)
        end

        def post
            @post = Post.find(params[:post_id])
        end

end
