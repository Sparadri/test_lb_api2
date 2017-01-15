class Api::V1::CollectionersController < Api::V1::BaseController
  before_action :set_collectioner, only: [ :show, :update ]

  def index
    @collectioners = policy_scope(Collectioner.all)
    render :index
  end

  def create
    @collectioner = Collectioner.new(collectioner_params)
    authorize @collectioner
    if @collectioner.save
      render json: @collectioner, status: :created
    else
      render_error
    end
  end

  def update
    authorize @collectioner
    if @collectioner.update(collectioner_params)
      render json: @collectioner
    else
      render_error
    end
  end

  private

  def set_collectioner
    @collectioner = Collectioner.find(params[:id])
  end

  def collectioner_params
    params.require(:collectioner).permit(:first_name, :last_name, :facebook_url, :twitter_url, :instagram_url, :pinterest_url)
  end

  # method to send full error message as JSON with 404; could be put in application controller cause same for all controlers.
  def render_error
    render json: { errors: @collectioner.errors.full_messages }, status: :unprocessable_entity
  end

end
