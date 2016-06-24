module Adminka
  class ProductsController < ApplicationController
    def index
      @products = Product.order(:id).page params[:page]
    end

    def new
      @product = Product.new
    end

    def edit
      @product = find_product
    end

    def show
      @dreamers = find_product
    end

    def create
      @product = Product.new(full_product_params)
      if @product.save
        render :edit
      else
        render :edit
      end
    end

    def update
      @product = find_product
      if @product.update_attributes(full_product_params)
        render :edit
      else
        render :edit
      end
    end

    def destroy
      Product.where(id: params[:id]).destroy_all
      redirect_to adminka_products_path
    end

    private

    def product_params
      params.require(:product).permit(:title, :text, :price, :category_id, :brand_id)
    end

    def full_product_params
      brand_id = Brand.find_by(title: params[:product][:brand]).id
      category_id = Category.find_by(name: params[:product][:category]).id
      product_params.merge(brand_id: brand_id, category_id: category_id)
    end

    def find_product
      Product.find(params[:id])
    end
  end
end
