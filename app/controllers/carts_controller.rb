class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  def index
    @carts = current_user.carts
  end
  def show
  end
  def new
    @cart = current_user.carts.new
  end
  def create
    @cart = current_user.carts.new(cart_params)
    if @cart.save
      redirect_to root_path
    else
      render :new 
    end
  end
  def edit
  end
  def update
    if @cart.update(cart_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    @cart.destroy
    redirect_to root_path
  end
  private 
    def cart_params
      params.require(:cart).permit(:total)
    end
    def set_cart
      @cart = current_user.carts.find(params[:id])
    end
end