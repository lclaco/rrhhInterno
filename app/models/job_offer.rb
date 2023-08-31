class JobOffer < ApplicationRecord
    has_many :applications
    has_many :applicants, through: :applications, source: :user
    belongs_to :created_by, class_name: 'User', foreign_key: :created_by_id
end
