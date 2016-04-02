class CategoriesController < ApplicationController
  def show
    @properties = Category.includes(properties: :values).find(params[:id]).properties
  end
end
