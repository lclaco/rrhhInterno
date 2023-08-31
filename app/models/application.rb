class Application < ApplicationRecord
    belongs_to :user
    belongs_to :job_offer
    belongs_to :applicant, class_name: 'User', foreign_key: 'user_id'
    validates :user_id, uniqueness: { scope: :job_offer_id, message: 'Ya te has postulado a esta oferta laboral.' }


    after_create :notify_esteban

  private

  def notify_esteban    
    EstebanMailer.notify_application(self).deliver_now
  end

end