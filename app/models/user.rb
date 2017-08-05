class User < ApplicationRecord
  has_secure_password
  has_many :commune_users, :dependent => :destroy
  has_many :communes,through: :commune_users
  has_many :task_completions

  validates :username, presence: true, uniqueness: true, length: {in: 2..30}
  validates :name, presence: true, length: {in: 2..30 }
  validates :password, confirmation: true, length: { in: 8..20 }, :if => :password

  def self.from_token_request request
    username = request.params['auth'] && request.params['auth']['username']
    self.find_by username: username
  end

  def to_json
    super(:except => [:password_digest])
  end


  def not_found
    @error = KolhoosiError.new('Username or password wrong.')
    render 'error', status: 401
  end

end
