class PostsController < ApplicationController
    helper_method :post

    def index
        @posts = Post.all.order(created_at: 'desc')
    end

    def new
        @post = Post.new
    end

    #ここの省略はできない？
    def edit
        post
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to posts_path
            flash[:notice] = "記事を投稿しました"
        else
            render 'new'
            flash[:notice] = "記事を投稿できませんでした"
        end
    end

    def update
        post
        if @post.update(post_params)
            flash[:notice] = "記事を更新しました"
            redirect_to posts_path
        else
            render 'edit'
            flash.now[:notice] = "記事を更新できませんでした"
        end
    end

    def destroy
        post
        if @post.destroy
            flash[:notice] = "記事を削除しました"
            redirect_to posts_path
        else
            render 'index'
            flash.now[:notice] = "記事を削除できませんでした"
        end
    end

    private
        def post_params
            params.require(:post).permit(:title, :body)
        end

        def post
            @post = Post.find(params[:id])
        end

end
