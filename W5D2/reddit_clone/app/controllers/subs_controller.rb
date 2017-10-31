class SubsController < ApplicationController
  before_action :require_logged_in
  before_action :require_sub_moderator, only: [:edit, :update]

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])
  end

  def index
    @subs = Sub.all
  end

  def edit; end

  def update
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors if @sub
      render :edit
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def require_sub_moderator
    @sub = Sub.find_by(id: params[:id])
    redirect_to subs_url unless current_user == @sub.moderator
  end
end
