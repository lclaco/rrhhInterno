class EstebanMailer < ApplicationMailer
    def notify_application(application)
        @application = application
        @job_offer = application.job_offer
        @user = application.user
        
        mail(to: 'esteban@rrhhInterno.cl', subject: 'Nueva postulación recibida')
    end
end
