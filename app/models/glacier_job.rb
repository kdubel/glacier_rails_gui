class GlacierJob < ApplicationRecord

  belongs_to :aws_account
  has_many :glacier_vault_elements

  STATUSES = %w['scheduled', 'completed', 'canceled']

end
