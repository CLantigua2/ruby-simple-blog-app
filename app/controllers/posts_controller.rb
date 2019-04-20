# handles everything in the /posts/ route
class PostsController < ApplicationController
    # this would be the root "posts/" route
    def index

    end

    def show
        # this will find the post id to display
        @post = Post.find(params[:id])
    end

    # this will take care of the form
    # "/posts/new"
    def new

    end

    def create
        # this returns an object with the title and the body that was submitted through the form post
        # render plain: params[:post].inspect
        # this step creates a new post with the post params
        @post = Post.new(post_params)
        # this step saves the post
        @post.save
        # this step will load the show view that will display the post
        redirect_to @post
    end

    # this method will define what a post will look like
    private def post_params
        # here we grab the post object and shove the title and body attribute into it
        params.require(:post).permit(:title, :body)
    end
end
