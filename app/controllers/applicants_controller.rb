class ApplicantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_applicants
  # before_action :set_job_offer, only: [:index]

  def index
    @applications = current_user.applications.includes(:job_offer)

    if current_user.esteban?
      @users = User.all
    else
      set_job_offer
    end
  end

  private

  def set_applicants
    @applicants = Application.includes(:user, :job_offer).all
  end

  def set_job_offer
    @job_offer = JobOffer.find_by(id: params[:job_offer_id])

    if @job_offer.nil?
      redirect_to job_offers_path, alert: 'La oferta laboral no existe.'
    else
      @applicants = @job_offer.applications
    end
  end
end

