module Adminka
  class ImagesController < ApplicationController
    def destroy
      Image.where(id: params[:id]).destroy_all
      redirect_to :back
    end
  end
end
