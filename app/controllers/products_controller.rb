class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new

    @product.name = params[:product][:name]
    @product.description = params[:product][:description]
    @product.price_in_cents = params[:product][:price_in_cents]

    if @product.save
      flash[:notice] = "Product successfully created"
      redirect_to '/products'

    else
      render :new
    end

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product successfully deleted"
    redirect_to products_path
  end

  def update
    @product = Product.find(params[:id])
      if @product.update(product_params)
        flash[:notice] = "Product successfully updated"
        redirect_to @product
      else
        redirect_back_or_to @product
      end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
  end

  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end

end
