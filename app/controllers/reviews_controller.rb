class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def index
    @product = Product.find(params[:product_id])
    @review = Review.all
    render product_reviews_path
  end

 def show
   @product = Product.find(params[:product_id])
   @review = Review.find(params[:id])
   render :show
 end

def edit
  @product = Product.find(params[:product_id])
  @review = Review.find(params[:id])
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

  def update
    @review = Review.find(params[:id])

    if @review.update(comment: params[:review][:comment])
      flash[:notice] = "You have successfully updated a review."
      redirect_to product_path
    else
      render :edit
    end
  end
end
