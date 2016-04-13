class User < ActiveRecord::Base
# we set relationships between tables in our databases (bertwee users and microposts)
  has_many :microposts
end
