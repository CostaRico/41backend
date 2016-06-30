module Adminka
  class ValuesController < ApplicationController
    def index
      @properties = Property.order(:id).
                page params[:page]
      respond_to do |format|
        format.js { render json: @values, root: false }
        format.html
      end
    end

    def new
      @value = Value.new
    end

    def edit
      @value = find_value
    end

    def show
      @value = find_value
    end

    def create
      @value = Value.new(property_params)
      if @value.save
        render :edit
      else
        render :edit
      end
    end

    def update
      @value = find_value
      if @value.update_attributes(full_property_params)
        render :edit
      else
        render :edit
      end
    end

    def destroy
      find_value.destroy
      redirect_to adminka_values_path
    end

    private

    def property_params
      params.require(:property).permit(:name, :description)
    end

    def full_property_params
      categ_ids = Category.where(name: params[:property][:categories]).map(&:id)
      property_params.merge(category_ids: categ_ids)
    end

    def find_value
      Value.find(params[:id])
    end
  end
end
