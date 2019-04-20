# handles everything in the /posts/ route
class PostsController < ApplicationController
    # this would be the root "posts/" route
    def index
        # this will display all of the posts on index page
        @posts = Post.all
    end

    # this will find the post id to display
    def show
        @post = Post.find(params[:id])
    end

    # this will take care of the form
    # "/posts/new"
    def new
        @post = Post.new
    end

    # this will create a new post
    def create
        # this returns an object with the title and the body that was submitted through the form post
        # render plain: params[:post].inspect
        # this step creates a new post with the post params
        @post = Post.new(post_params)
        # this step saves the post
        if(@post.save)
            # this step will load the show view that will display the post
            redirect_to @post
        else
            render 'new'
        end
    end

    # this will handle the edit action
    def edit
        @post = Post.find(params[:id])
    end

    # this will handle submitting a new edit
    def update
        @post = Post.find(params[:id])

        if(@post.update(post_params))
            redirect_to @post
        else
            render 'edit'
        end
    end

    # this will handle deleting a post
    def destroy
        # find the post by id
        @post = Post.find(params[:id])
        # delete the post
        @post.destroy
        # redirect to the path that has all the remaining posts
        redirect_to posts_path
    end

    # this method will define what a post will look like
    private def post_params
        # here we grab the post object and shove the title and body attribute into it
        params.require(:post).permit(:title, :body)
    end
end
