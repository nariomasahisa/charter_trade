class PurchasesController < ApplicationController
  def index
    @charter = Charter.find(params[:charter_id])
    @sell = Sell.find(params[:charter_id])
    @user = User.find(params[:user_id])
    @purchase = Purchase.new
  end
  
  def create
    @charter = Charter.find(params[:charter_id])
    @purchase = Purchase.create(purchase_params)
    if @purchase.save
      redirect_to root_path
    end
  end
  private
  def purchase_params
    params.permit(:id).merge(user_id: current_user.id, charter_id: params[:charter_id])
  end
end