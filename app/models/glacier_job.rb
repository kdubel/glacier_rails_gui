class GlacierJob < ApplicationRecord

  belongs_to :aws_account
  has_many :glacier_vault_elements

  before_create :set_status

  def check_status

  end

  def process_job_output

  end

  private

  def set_status
    self.status = 'scheduled'
  end

end
