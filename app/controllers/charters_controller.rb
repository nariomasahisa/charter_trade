class ChartersController < ApplicationController
  def index
    @charters = Charter.all
  end
  def new
    @charter = Charter.new
  end

  def show
    @charter = Charter.find(params[:id])  
  end

  def create
    @charter = Charter.create(charter_params)
    if @charter.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @charter = Charter.find(params[:id])
  end

  def update
    @charter = Charter.find(params[:id])
    if @charter.update(charter_params)
      redirect_to  charter_path(@charter)
    else
      render :edit
    end
  end

  private
  def charter_params
    params.require(:charter).permit(:departure, :arrive, :size, :delivery_date, :buy_price, :prefecture_id, :city, :charter_address, :build_name, :tell_number).merge(user_id: current_user.id)
  end
end
