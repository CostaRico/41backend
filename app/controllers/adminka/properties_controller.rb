module Adminka
  class PropertiesController < ApplicationController
    def index
      @properties = Property.order(:id).page params[:page]
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
        redirect_to adminka_properties_path
      else
        render :edit
      end
    end

    def update
      @property = find_property
      if @property.update_attributes(property_params)
        redirect_to adminka_properties_path
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

    def find_property
      Property.find(params[:id])
    end
  end
end
