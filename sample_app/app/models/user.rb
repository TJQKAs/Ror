class User < ActiveRecord::Base
  attr_accessor :remember_token
  #we want that all emails will be converted to lowercase view before we
  #save it in data base
  before_save {self.email = email.downcase}
  # checks that we have name
  validates  :name,            presence: true, length: {maximum: 30}
  validates  :nickname,     presence: true, length: {maximum: 255}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\z/
  validates  :email,            presence: true, length: {maximum: 30, minimum: 5},
                                         format: {with: VALID_EMAIL_REGEX},
                                         uniqueness: {case_sensetive: false}
  #add functionality for secure password
  has_secure_password
  validates  :password,  length: {minimum: 8}

  # returns the hash digest of user
  def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                                                        BCrypt::Engine.cost
                                                                                        BCrypt::Password.create(string, cost: cost)
  end

  # returns random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # remember user in db for use in persistent session
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end


 def forget
       update_attribute(:remember_digest, nil)
 end


  def authenticated?(remember_token)
  # returns true if the given token matches the digest
    return false if remember_digest.nil?
     BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end


end
