class ReviewsController < ApplicationController
    before_action :authenticate_user!

    def create 
        @product = Product.find(params[:product_id])
        @review = Review.new params.require(:review).permit(:rating, :body)
        @review.product = @product
        @review.user = current_user
        if @review.save
            flash[:primary] = "Review saved"
            redirect_to @product
        else
            flash[:danger] = @review.errors.full_messages.join(', ')
            @reviews = @product.reviews.order(created_at: :desc)
            render 'products/show'
        end
    end

    def destroy
        @review = Review.find(params[:id])
        if @review.destroy
            flash[:primary] = "Review deleted"
            redirect_to product_path(@review.product)
        else
            head :unauthorized
        end
    end
end
