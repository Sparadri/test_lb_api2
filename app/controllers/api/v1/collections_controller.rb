class Api::V1::CollectionsController < Api::V1::BaseController

  before_action :set_collection, only: [ :show, :update, :email ]

  def index
    collections = policy_scope(Collection)
    @filtered_collections = collections.filter(params.slice(:sort_by_collectioner_name, :sort_by_recency))
    p User.all.each { |user| p user.tokens }
    render :index
    # render json: @collections.filter(params.slice(:sort_by_collectioner_name, :sort_by_recency))
  end

  def show
    authorize @collection
    render :show
  end

  def create
    @collection = Collection.new(collection_params)
    authorize @collection
    if @collection.save
      render json: @collection, status: :created
    else
      render_error
    end
  end

  def update
    authorize @collection
    if @collection.update(collection_params)
      render json: @collection
    else
      render_error
    end
  end

  def email
    authorize @collection
    # IMPORTANT always pass very simple things to redis [ie. never instances] otherwise bug
    NewCollectionJob.perform_later({id: @collection.id, details: email_params})
    render json: {status: 'email sent'}, status: :created
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:title, :is_live, :collectioner_id, :main_cover_picture, :interview_cover_picture, :profile_picture)
  end

  # collect newsletter settings to create mailChimp campaign
  def email_params
    params.require(:email).permit(:email_subject_line, :campaign_title, :list_type)
  end

  # method to send full error message as JSON with 422; could be put in application controller cause same for all controlers.
  def render_error
    render json: { errors: @collection.errors.full_messages }, status: :unprocessable_entity
  end
end

# https://www.airbnb.com/s/Lisbon--Portugal?guests=1&adults=1&infants=0&children=0&ib=true&ss_id=5ltbatzl&ss_preload=true&source=bb&page=1&allow_override%5B%5D=&price_min=27&s_tag=2Bqa9CFp
