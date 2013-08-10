class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true, email: true
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }  #not working

  include BCrypt

  def self.authenticate(email, password)
    @user = self.find_by_email(email)
    return @user if @user && (@user.password == password)
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end


# has_secure_password - validations for presence on create/confirmation auto added. 
