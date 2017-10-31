class PostsController < ApplicationController
  before_action :require_change_permissions, only: [:edit, :update, :delete]

  helper_method :can_make_changes?

  def new
    @post = Post.new(sub_id: params[:sub_id])
  end

  def create
    @post = Post.new(post_params)
    @post.sub_id = params[:sub_id]
    @post.author_id = current_user.id
    if @post.save
      redirect_to sub_post_url(id: @post.id, sub_id: params[:sub_id])
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    lookup_post
  end

  def destroy
    lookup_post
    parent_sub_id = @post.sub_id
    @post.destroy
    redirect_to sub_url(parent_sub_id)
  end

  def edit
    lookup_post
  end

  def update
    lookup_post
    if @post.update(post_params)
      redirect_to sub_post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def can_make_changes?
    is_author? || is_moderator?
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, cross_post_sub: [] )
  end

  def is_moderator?
    lookup_post
    @post.sub.moderator == current_user
  end

  def is_author?
    lookup_post
    @post.author == current_user
  end

  def require_change_permissions
    redirect_to sub_post_url(@post) unless can_make_changes?
  end

  def lookup_post
    @post ||= Post.find_by(id: params[:id])
  end
end
