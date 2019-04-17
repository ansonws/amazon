class ProductsController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    before_action :find_product, only: [:show, :update, :destroy, :edit]

    def index
        @products = Product.order(created_at: :DESC)
    end

    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new product_params
        @product.user_id = current_user.id
        if @product.save
            redirect_to product_path @product
        else
            render :new
        end
    end

    def show
        @review = Review.new
        @reviews = Review.where(product_id: @product).order(created_at: :ASC)
    end

    def edit
        
    end

    def update
        if @product.update product_params
            redirect_to product_path
        else 
            render :edit
        end
    end

    def destroy
        @product.destroy
        redirect_to products_path
    end

    private

    def product_params
        params.require(:product).permit(:title, :description, :price)
    end

    def find_product
        @product = Product.find params[:id]
    end
end
