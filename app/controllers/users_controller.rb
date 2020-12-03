class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @purchases = Purchase.all
    @charter = Charter.find(params[:id])
  end
end
