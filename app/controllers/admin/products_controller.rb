class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
    redirect_to admin_products_path
    else
      @product = Product.new
      render :new
    end
  end

  def index
    @products = Product.all
  end

  def show
  end

  def edit
  end
  def update
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :introduction, :genre_id, :price_excluding, :out_of_stock, :image_id)
  end

end
