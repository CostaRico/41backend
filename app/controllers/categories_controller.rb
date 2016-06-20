class CategoriesController < ApplicationController
  def index
    render json: Category.all, each_serializer: CategorySerializer
  end

  def show
    @properties = Category.includes(properties: :values).find(params[:id]).properties
  end
end
