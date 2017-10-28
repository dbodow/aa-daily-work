class BandsController < ApplicationController
  before_action :require_logged_in

  def index
    render :index
  end

  def show
    render :show
  end

  def new
    render :new
  end

  def create
    band = Band.new(band_params)
    if band.save
      redirect_to band_url(band.id)
    else
      flash.now[:errors] = band.errors.full_messages
      flash.now[:band_name] = band.name
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    band = Band.find_by(id: params[:id])
    band.name = band_params(:name)
    if band.save
      redirect_to band_url(id: params[:id])
    else
      flash.now[:band_name] = band.name
      render :edit
    end
  end

  def destroy
    band = Band.find_by(id: params[:id])
    if band.destroy
      redirect_to bands_url
    else
      flash.now[:errors] = ["Band deletion failed."]
      render band_url(params[:id])
    end
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
