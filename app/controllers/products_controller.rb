class ProductsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_product, only: [:show, :edit, :update, :destroy]

    def index 
        @products = Product.all.order(created_at: :asc)
    end

    def new
        @product = Product.new
    end

    def create 
        @product = Product.new product_params
        @product.user = current_user
        if @product.save
            flash[:primary] = "Created product \"#{@product.title}\""
            redirect_to product_path(@product)
        else
            flash[:danger] = @product.errors.full_messages.join(', ')
            render :new
        end
    end

    def show
        @review = Review.new
        @reviews = @product.reviews.order(created_at: :desc) 
    end

    def edit
    end

    def update
        if @product.update product_params
            flash[:primary] = "#{@product.title} was updated"
        else
            flash[:danger] = @product.errors.full_messages.join(', ')
        end
        redirect_to product_path(@product)
    end

    def destroy
        @product.destroy
        redirect_to products_path
    end

    private 

    def find_product
        @product = Product.find(params[:id])
    end

    def product_params
        params.require(:product).permit(:title, :description, :price)
    end
end
