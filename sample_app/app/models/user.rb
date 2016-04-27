class User < ActiveRecord::Base
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
end
