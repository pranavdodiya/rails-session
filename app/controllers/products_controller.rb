class ProductsController < ApplicationController
    def index
      @products = Product.all
    end
  
    def new
      @product = Product.new
    end
  
    def create
      @product = Product.create(product_params)
      
      redirect_to products_path
    end
  
    def edit
      @product = Product.find(params[:id])
    end
  
    def update
      @product = Product.find(params[:id])
      @product.update(product_params)
      redirect_to products_path
    end
  
    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_path
    end

    def addto_cart
      if session[:product_id]==nil 
        session[:product_id]=[]
      else
        session[:product_id] <<params[:id]
      end
        redirect_to show_cart_path     
    end

    def show_cart
    end

    

    def delete_cart
        if session[:product_id].include?(params[:id])
            session[:product_id].pop[params[:id]]
        end
        redirect_to show_cart_path

    end 
  
    private
      def product_params
        params.require(:product).permit(:name, :price)
      end
  end