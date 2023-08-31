class Publicacion < ApplicationRecord
    belongs_to :posted_by, class_name: 'User'
end
