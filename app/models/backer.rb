class Backer < ApplicationRecord
  belongs_to :project_plan
  belongs_to :user
end
