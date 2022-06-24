class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy like]
  before_action :authenticate_user!

  def index
    @posts = Post.search(params)
    # .all.order(created_at: :desc)
    # TODO: include comments + lazy_load
  end

  # TODO: update routes to exclude unused actions

  def edit; end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.turbo_stream
      else
        # TODO: display error
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.turbo_stream { flash.now[:notice] = "Post was successfully updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = "Post was successfully deleted" }
    end
  end

  def like
    if params[:type] == 'like'
      @post.liked_by current_user
    elsif params[:type] == 'unlike'
      @post.unliked_by current_user
    end

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :likes, :user_id, :image)
  end
end
