class Admin::ProductsController < ApplicationController

  layout 'admin'
  
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
    @products = Product.page(params[:page]).reverse_order
  end

  def show
    @product = Product.find(params[:id])
    @genre = Genre.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(@product.id)
  end

  private
  def product_params
    params.require(:product).permit(:name, :introduction, :genre_id, :price_excluding, :out_of_stock, :image_id)
  end

end
