class ProjectPlan < ApplicationRecord
  has_many_attached :images
  has_many :backers, dependent: :restrict_with_error
end
