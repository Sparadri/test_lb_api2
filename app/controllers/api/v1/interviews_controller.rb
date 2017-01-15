class Api::V1::InterviewsController < Api::V1::BaseController

  before_action :set_interview, only: [ :update ]

  def create
    @interview = Interview.new(interview_params)
    authorize @interview
    if @interview.save
      render json: @interview, status: :created
    else
      render_error
    end
  end

  def update
    authorize @interview
    if @interview.update(interview_params)
      render json: @interview
    else
      render_error
    end
  end

  private

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def interview_params
    params.require(:interview).permit(:collection_id, :question, :answer, :placement, :picture)
  end

  # method to send full error message as JSON with 422; could be put in application controller cause same for all controlers.
  def render_error
    render json: { errors: @interview.errors.full_messages }, status: :unprocessable_entity
  end

end

# https://www.airbnb.com/s/Lisbon--Portugal?guests=1&adults=1&infants=0&children=0&ib=true&ss_id=5ltbatzl&ss_preload=true&source=bb&page=1&allow_override%5B%5D=&price_min=27&s_tag=2Bqa9CFp
