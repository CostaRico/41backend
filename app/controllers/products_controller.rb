class ProductsController < InheritedResources::Base

  respond_to :html, :xml, :json
  actions :index, :show, :new, :create

  def index
    respond_to do |format|
      # data = { "data" => Product.all.to_json , 'count' => Product.count }
      # format.json { render json: Oj.dump(data) }
      format.json { render json: [Product.all, Product.count] }
    end
  end

  private

    def product_params
      params.require(:product).permit(:title, :text, :price, :category_id, value_ids:[])
    end
end

