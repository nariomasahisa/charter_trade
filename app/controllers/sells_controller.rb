class SellsController < ApplicationController  
  def index
    @sells = Sell.all.order("sell asc")
  end
  def create
    @sell = Sell.create(sell_params)
    if @sell.save
      redirect_to charter_path(@sell.charter)
    else
      @charter = @sell.charter
      @sell = @charter.sell
      render "charters/show"
    end
  end

  private
  def sell_params
    params.require(:sell).permit(:sell).merge(user_id: current_user.id, charter_id: params[:charter_id])
  end
end
