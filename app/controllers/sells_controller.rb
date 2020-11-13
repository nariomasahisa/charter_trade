class SellsController < ApplicationController  
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

  def destroy
    @sell = Sell.find(params[:id])
    charter = Charter.find(params[:charter_id])
    if @sell.destroy
      redirect_to "/charters/#{charter.id}"
    end
  end

  private
  def sell_params
    params.require(:sell).permit(:sell).merge(user_id: current_user.id, charter_id: params[:charter_id])
  end
end
