module Adminka
  class CategorysController < ApplicationController
    def index
      @categories = Category.order(:id).page params[:page]
    end

    def new
      @category = Category.new
    end

    def edit
      @category = find_category
    end

    def show
      @categories = find_category
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to adminka_categories_path
      else
        render :edit
      end
    end

    def update
      @category = find_category
      if @category.update_attributes(category_params)
        redirect_to adminka_categories_path
      else
        render :edit
      end
    end

    def destroy
      Category.where(id: params[:id]).destroy_all
      redirect_to adminka_categories_path
    end

    private

    def category_params
      params.require(:category).permit(:name, category_id)
    end

    def find_category
      Category.find(params[:id])
    end
  end
end
