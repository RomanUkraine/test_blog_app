class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end

  def show; end

  # def new
  #   @post = Post.new
  # end
  # TODO: update routes to exclude this action

  def edit; end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.turbo_stream do
          render turbo_stream:
                   turbo_stream.replace(
                     @post,
                     partial: 'posts/form',
                     locals: {
                       post: @post
                     }
                   )
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html do
          redirect_to post_url(@post), notice: 'Post was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html do
        redirect_to posts_url, notice: 'Post was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :likes, :user_id)
  end
end
