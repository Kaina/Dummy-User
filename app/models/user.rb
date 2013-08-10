
class User < ActiveRecord::Base

  attr_accessor :password

  validates :email, presence: true, uniqueness: true, email: true
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  before_save :hash_password


  include BCrypt

  def self.authenticate(email, password)
    @user = self.find_by_email(email)
    return @user if @user && Password.new(@user.password_hash) == password
  end

  def hash_password
    self.password_hash = Password.create(self.password)
  end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end

end


# has_secure_password - validations for presence on create/confirmation auto added. 

#   def self.create(options={})
#     @user = User.new(:email => options[:email])
#     puts options[:password]
#     @user.password = options[:password]
#     @user.save!
#     @user
#   end

# end
