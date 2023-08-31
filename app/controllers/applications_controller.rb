  class ApplicationsController < ApplicationController

    def index
      @applications = current_user.applications
    end

    def new
      @job_offer = JobOffer.find(params[:job_offer_id])
      @application = @job_offer.applications.build
    end

    def create
      @job_offer = JobOffer.find(params[:job_offer_id])
      @application = @job_offer.applications.build(user: current_user)

      if @application.save
        # Aquí puedes enviar un mensaje a Esteban avisando de la postulación
        # Supongamos que tienes un método en tu modelo User para enviar mensajes.
        User.esteban.notify_new_application(@application)

        redirect_to job_offers_path, notice: '¡Te has postulado correctamente!'
      else
        redirect_to job_offer_path(@job_offer), alert: 'No se pudo postular en esta oferta laboral.'
      end
    end

    def destroy
      @application = Application.find(params[:id])
      if @application.user == current_user
        @application.destroy
        redirect_to applications_path, notice: 'Postulación eliminada correctamente.'
      else
        redirect_to applications_path, alert: 'No tienes permiso para eliminar esta postulación.'
      end
    end


  end
    