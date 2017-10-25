# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null

class CatRentalRequestsController < ApplicationController

  def index
    @cat_rental_requests =  if params[:cat_id]
                              CatRentalRequest.where(cat_id: params[:cat_id])
                            else
                              CatRentalRequest.all
                            end
    render :index
  end

  def new
    @all_cats = Cat.all
    @cat_rental_request = CatRentalRequest.new
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    # @cat_rental_request.valid?
    # p @cat_rental_request.errors.full_messages
    if @cat_rental_request.save
      redirect_to cat_rental_request_url(@cat_rental_request)
    else
      render json: @cat_rental_request.errors.full_messages
      # redirect_to new_cat_rental_request_url
    end
  end

  def show
    @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    if @cat_rental_request
      render :show
    else
      redirect_to cat_rental_requests_url
    end
  end

  def approve
    @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    if @cat_rental_request.approve!
      redirect_to cat_rental_request_url(@cat_rental_request)
    else
      redirect_to cat_url(params[:cat_id])
    end
  end

  def deny
    @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    if @cat_rental_request.deny!
      redirect_to cat_rental_request_url(@cat_rental_request)
    else
      redirect_to cat_url(params[:cat_id])
    end
  end

  private

  def cat_rental_request_params
    params.require('cat_rental_request').permit(:cat_id, :start_date, :end_date, :status)
  end
end
