class User < ApplicationRecord
  has_many :applications
  has_many :job_offers, foreign_key: :created_by_id
  has_many :publications, foreign_key: :posted_by_id
  has_one_attached :photo  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: { normal: 0, esteban: 1 }
  
  before_validation :set_default_role, on: :create
  
  attr_accessor :profile_picture

  validates :email, uniqueness: true

  private

  def set_default_role
    self.role ||= :normal
  end
       
end
