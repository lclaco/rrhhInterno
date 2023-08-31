class ApplicationController < ActionController::Base  
  # before_action :authenticate_user!

  # def index
  #   #@applicants = current_user.applications
  #   @applications = current_user.applications
  # end

  # def create
  #   @job_offer = JobOffer.find(params[:job_offer_id])
  #   @application = @job_offer.applications.build(user: current_user)

  # if @application.save
  #   # Aquí puedes enviar un mensaje a Esteban avisando de la postulación
  #   redirect_to @job_offer, notice: '¡Te has postulado correctamente!'
  # else
  #   redirect_to @job_offer, alert: 'No se pudo postular en esta oferta laboral.'
  # end
  # end
  
  # def destroy
  #   @application = Application.find(params[:id])
  #   if @application.user == current_user
  #     @application.destroy
  #     redirect_to applications_path, notice: 'Postulación eliminada correctamente.'
  #   else
  #     redirect_to applications_path, alert: 'No tienes permiso para eliminar esta postulación.'
  #   end
  # end

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:photo])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:photo])
  # end


end
