class AwsService

  def initialize(user_id)
    user = User.find(user_id)
    @account = user.aws_account
  end

  def credentials
    return Aws::Credentials.new(@account.aws_id, @account.aws_secret)
  end

  def get_all_regions
    aws = Aws::Partitions.partition('aws')
    aws.regions.map{|r| {name:r.name, desc:r.description} if r.services.include?('Glacier')}
  end

end