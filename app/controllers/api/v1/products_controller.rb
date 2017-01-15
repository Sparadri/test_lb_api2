class Api::V1::ProductsController < Api::V1::BaseController

  before_action :set_product, only: [ :show, :update ]

  # paginate should come at the end to take into account potential filtering
  # paginate could be in URL
  def index
    p '------------------------------------------------------------------------'
    p current_user
    p '------------------------------------------------------------------------'
    @filtered_products = policy_scope(Product)
      .filter(params.slice(:category, :collectioner, :sort_by))
      # .paginate(page: params[:page], per_page: 30)
    render :index
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    if @product.save
      render json: @product, status: :created
    else
      render_error
    end
  end

  def update
    authorize @product
    if @product.update(product_params)
      render json: @product
    else
      render_error
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:collection_id, :is_live, :title, :description, :price, :picture, :shop_url)
  end

  # method to send full error message as JSON with 422; could be put in application controller cause same for all controlers.
  def render_error
    render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
  end
end


# Product.all.map do |product|
#   p if product.collection.collectioner == if product.collection
# end
