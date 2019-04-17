class ReviewsController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    before_action :find_product, only: [:show, :edit, :update, :destroy]
    before_action :authorize!, only: [:edit, :update, :destroy]
    
    def create
        @product = Product.find(params[:product_id])
        @review = Review.new params.require(:review).permit(:rating, :body)
        @review.product = @product
        @review.user = current_user
        @review.save
        unless @review.save
            flash[:notice] = @review.errors.full_messages.join(', ')
        end
        redirect_to product_path @product 
    end

    def destroy
        @review = Review.find params[:id]
        @review.destroy
        redirect_to product_path @review.product
    end
end
