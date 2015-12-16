class Hq::User < ActiveRecord::Base


  attr_accessor :password
  before_save :encrypt_password


  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(username, password)
    visitor = find_by_username(username)
    if visitor && visitor.password_hash == BCrypt::Engine.hash_secret(password, visitor.password_salt)
      visitor
    else
      nil
    end
  end

end
