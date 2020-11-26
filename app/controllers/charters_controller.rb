class ChartersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_charter, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only:[:edit, :destroy]
  
  def index
    @charters = Charter.all
    @purchases = Purchase.all
  end
  def new
    @charter = Charter.new
  end

  def create
    @charter = Charter.create(charter_params)
    if @charter.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @sell = Sell.new
    @sells = @charter.sells.order(sell: :asc).order(created_at: :asc).first(1)
    @purchase = Purchase.new
  end
  
  def edit  
  end

  def update
    if @charter.update(charter_params)
      redirect_to  charter_path(@charter)
    else
      render :edit
    end
  end

  def destroy
    if @charter.destroy
      redirect_to root_path
    end
  end

  def search
    @charters = Charter.search(params[:keyword]) 
  end

  private
  def charter_params
    params.require(:charter).permit(:departure, :arrive, :size, :delivery_date, :buy_price, :prefecture_id, :city, :charter_address, :build_name, :tell_number).merge(user_id: current_user.id)
  end

  def set_charter
    @charter = Charter.find(params[:id])
  end

  def move_to_index
    @charter = Charter.find(params[:id])
    unless current_user.id == @charter.user_id
      redirect_to root_path
    end
  end
end
