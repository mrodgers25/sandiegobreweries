require 'bcrypt'

class User < ActiveRecord::Base
    include BCrypt

    has_many :reviews

    validates :email, :password_hash, { presence: true }
    validates :email, uniqueness: true

    # has_secure_password



  # validates :hashed_password, presence: true
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

#also known as self.login AUTHENTICATING
  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user && user.password == password
      user
    else
       nil
    end
  end

    # def self.authenticate(args)
    #     self.find_by(email: args[:matcher]).try(:authenticate, args[:password])       # email
    # end

end
