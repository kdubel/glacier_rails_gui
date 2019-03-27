class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :aws_account, dependent: :destroy


  after_create :create_aws_account

  def self.glacier_jobs
    self.aws_account.try(:glacier_jobs)
  end

  def has_aws_keys
    !self.aws_account.aws_id.nil? and !self.aws_account.aws_secret.nil?
  end

  private

  def create_aws_account
    a = AwsAccount.new(user_id: self.id)
    a.save!
  end

end
