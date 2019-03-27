class AwsAccount < ApplicationRecord
  belongs_to :user
  has_many :glacier_jobs

  attr_encrypted :aws_secret, :key => Rails.application.credentials.aws[:secret_base]

end
