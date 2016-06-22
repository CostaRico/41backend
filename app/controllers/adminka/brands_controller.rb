module Adminka
  class BrandsController < ApplicationController
    def index
      @brands = Brand.order(:id).page params[:page]
    end

    def new
      @brand = Brand.new
    end

    def edit
      @brand = find_brand
    end

    def show
      @brand = find_brand
    end

    def create
      @brand = Brand.new(brand_params)
      if @brand.save
        redirect_to adminka_brands_path
      else
        render :edit
      end
    end

    def update
      @brand = find_brand
      if @brand.update_attributes(brand_params)
        redirect_to adminka_brands_path
      else
        render :edit
      end
    end

    def destroy
      find_brand.destroy
      redirect_to adminka_brands_path
    end

    private

    def brand_params
      params.require(:brand).permit(:name, :description)
    end

    def find_brand
      Brand.find(params[:id])
    end
  end
end
