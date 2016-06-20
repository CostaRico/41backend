class ProductsController < InheritedResources::Base

  respond_to :html, :xml, :json
  actions :index, :show, :new, :create

  def index
    scope = Product.includes(:category).limit(9)

    products = if category_id!="0"
                 scope.where(category_id: category_id)
               else
                 scope
               end
    if value_ids.present?

      product_ids = Value.product_ids(value_ids)
      products = products.joins(:values).where(id: product_ids)
              # binding.pry
    end

    respond_to do |format|
      format.js { render json: [products, Product.count] }
      format.json { render json: products, each_serializer: ProductSerializer }
    end
  end


  private

    def product_params
      params.require(:product).permit(:title, :text, :price, :category_id, value_ids:[])
    end

    def category_id
      params[:category_id]
    end

    def value_ids
      params[:value_ids] && params[:value_ids].split(',').reject(&:empty?).map(&:to_i)
    end
end

