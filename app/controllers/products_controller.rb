class ProductsController < InheritedResources::Base

  respond_to :html, :xml, :json
  actions :index, :show, :new, :create

  def index
    products = Product.includes(:category).limit(9)
    products = products.where(category_id: category_id) if category_id!="0"
    respond_to do |format|
      # data = { "data" => Product.all.to_json , 'count' => Product.count }
      # format.json { render json: Oj.dump(data) }
      format.json { render json: [products, Product.count] }
    end
  end

  private

    def product_params
      params.require(:product).permit(:title, :text, :price, :category_id, value_ids:[])
    end

    def category_id
      params[:category_id]
    end
end

