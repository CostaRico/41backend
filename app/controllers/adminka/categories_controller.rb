module Adminka
  class CategoriesController < ApplicationController
    def index
      @categories = Category.where(category_id: nil).
                    order(:id).
                    includes(:properties).
                    page params[:page]
      respond_to do |format|
        format.js { render json: @categories, root: false }
        format.html
      end
    end

    def new
      @category = Category.new
    end

    def edit
      @category = find_category
    end

    def show
      @category = find_category
      @categories = find_category.categories
    end

    def create
      @category = Category.new(full_category_params)
      if @category.save
        redirect_to :back
      else
        render :edit
      end
    end

    def update
      @category = find_category
      if @category.update_attributes(full_category_params)
        render :edit
      else
        render :edit
      end
    end

    def destroy
      Category.where(id: params[:id]).destroy_all
      redirect_to :back
    end

    def search
      if params[:q] && params[:q].present?
        coll = Category.limit(20).ransack(name_cont_any: params[:q]).result
      else
        coll = Category.limit(20)
      end
      render json: coll, root: false
    end

    private

    def category_params
      params.require(:category).permit(:name, :category_id)
    end

    def full_category_params
      prop_ids = Property.where(title: params[:category][:properties]).map(&:id)
      category_params.merge(property_ids: prop_ids)
    end

    def find_category
      Category.find(params[:id])
    end
  end
end
