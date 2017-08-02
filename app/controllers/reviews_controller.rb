class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def index
    @product = Product.all
    @review = Review.all
    redirect_to product_path
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    @review.comment = params[:review][:comment]

    if @review.save
      flash[:notice] = "Review successfully created"
      redirect_to products_path

    else
      flash[:notice] = "Something went wrong"
      render :new
    end
  end
end
