class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.all
    render :new
  end

  def create
    @req = CatRentalRequest.new(req_params)
    if @req.save
      redirect_to cat_url(@req.cat_id)
    else
      redirect_to new_cat_rental_request_url
    end
  end

  private
  def req_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end