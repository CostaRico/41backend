module Adminka
  class ProductsController < ApplicationController
    def index
      @products = Product.order(:id).
                  includes(:category).
                  page params[:page]
    end

    def new
      @product = Product.new
    end

    def edit
      @product = find_product
    end

    def show
      @product = find_product
    end

    def create
      @product = Product.new(full_product_params)
      if @product.save
        property_product_creator
        render :edit
      else
        render :edit
      end
    end

    def update
      @product = find_product
      if @product.update_attributes(full_product_params)
        property_product_creator
        redirect_to [:edit, :adminka, @product]
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
      params.require(:product).permit(
        :title, :text, :price, :category_id, :brand_id,
        product_properties_attributes: [:id, :value_id, :man_value, :property_id])
    end

    def full_product_params
      brand_id = Brand.find_by(title: params[:product][:brand]).id rescue nil
      category_id = Category.find_by(name: params[:product][:category]).id
      product_params.merge(brand_id: brand_id, category_id: category_id)
    end

    def find_product
      @product ||= Product.find(params[:id])
    end

    def property_product_creator
      product = find_product
      unless product.properties.count == product.product_properties.count
        product.product_properties.where.not(property_id: product.property_ids).delete_all
        product.properties.each do |prop|
          unless product.product_properties.where(property_id: prop.id).exists?
            product.product_properties.create(property_id: prop.id)
          end
        end
      end
    end
  end
end
