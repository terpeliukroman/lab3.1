class GymShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_gym_shop, only: [:show, :edit, :update, :destroy]

  def index
    @gym_shops = GymShop.all
  end

  def show
  end

  def new
    @gym_shop = GymShop.new
  end

  def create
    @gym_shop = current_user.gym_shops.build(gym_shop_params)
    if @gym_shop.save
      redirect_to @gym_shop, notice: "Пам’ятка успішно створена."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @gym_shop.update(gym_shop_params)
      redirect_to @gym_shop, notice: "Пам’ятка успішно оновлена."
    else
      render :edit
    end
  end

  def destroy
    @gym_shop.destroy
    redirect_to gym_shops_url, notice: "Пам’ятка успішно видалена."
  end

  private

  def set_gym_shop
    @gym_shop = GymShop.find(params[:id])
  end

  def gym_shop_params
    params.require(:gym_shop).permit(:name, :description, :photo)
  end
end
