class ChartersController < ApplicationController
  def index
    @charters = Charter.all
  end
  def new
    @charter = Charter.new
  end

  def create
    @charter = Charter.create(charter_params)
    binding.pry
    if @charter.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def charter_params
    params.require(:charter).permit(:departure, :arrive, :size, :delivery_date, :buy_price, :prefecture_id, :city, :charter_address, :build_name, :tell_number).merge(user_id: current_user.id)
  end
end
