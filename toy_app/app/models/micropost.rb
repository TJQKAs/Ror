class Micropost < ActiveRecord::Base
# we set relationships between tables in our databases (bertwee users and microposts)
  belongs_to :user
# set the requirements of validation of  the info which we are going to type in input fields
  validates :content, length:{ minimum: 10, maximum: 50 }
end
