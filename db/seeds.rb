# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Crear al usuario "esteban"
# esteban = User.find_or_create_by!(
#     email: 'esteban@rrhhInterno.cl'
#   ) do |user|
#     user.password = 'password123'
#     user.role = :esteban
#   end
  
  # Crea algunas ofertas laborales
  # 10.times do
  #   job_offer = JobOffer.create!(
  #     title: Faker::Job.title,
  #     description: Faker::Lorem.paragraph,
  #     salary: rand(30000..100000),
  #     created_by: esteban
  #   )
  
    # Crea algunas postulaciones para cada oferta laboral
  #   rand(0..5).times do
  #     user = User.where(role: :normal).sample
  #     job_offer.applications.create!(applicant: user)
  #   end
  # end
  
  # Crea algunos usuarios normales
  # 5.times do
  #   User.create!(
  #     email: Faker::Internet.unique.email,
  #     password: 'password',
  #     role: :normal
  #   )
  # end
# Crear al usuario Esteban
esteban = User.create!(
  email: 'esteban@rrhhInterno.cl',
  password: 'password123',
  role: :esteban
)

# Crear algunos usuarios normales
5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    role: :normal
  )
end

# Crear algunas ofertas laborales
10.times do
  JobOffer.create!(
    title: Faker::Job.title,
    description: Faker::Lorem.paragraph,
    salary: rand(30000..100000),
    created_by: esteban
  )
end

# Crear postulaciones
users = User.all
job_offers = JobOffer.all

users.each do |user|
  job_offer = job_offers.sample
  Application.create!(applicant: user, job_offer: job_offer)
end
