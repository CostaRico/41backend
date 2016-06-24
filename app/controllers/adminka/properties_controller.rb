module Adminka
  class PropertiesController < ApplicationController
    def index
      @properties = Property.order(:id).page params[:page]
      respond_to do |format|
        format.js { render json: @properties, root: false }
        format.html
      end
    end

    def new
      @property = Property.new
    end

    def edit
      @property = find_property
    end

    def show
      @property = find_property
    end

    def create
      @property = Property.new(property_params)
      if @property.save
        render :edit
      else
        render :edit
      end
    end

    def update
      @property = find_property
      if @property.update_attributes(full_property_params)
        render :edit
      else
        render :edit
      end
    end

    def destroy
      find_property.destroy
      redirect_to adminka_properties_path
    end

    private

    def property_params
      params.require(:property).permit(:name, :description)
    end

    def full_property_params
      categ_ids = Category.where(name: params[:property][:categories]).map(&:id)
      property_params.merge(category_ids: categ_ids)
    end

    def find_property
      Property.find(params[:id])
    end
  end
end
