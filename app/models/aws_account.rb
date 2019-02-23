class AwsAccount < ApplicationRecord
  belongs_to :user
  has_many :glacier_jobs
end
