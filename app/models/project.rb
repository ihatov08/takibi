class Project < ApplicationRecord
  belongs_to :category

  has_one_attached :main_image
  has_many_attached :sub_images

  has_many :project_plans, dependent: :destroy
end
