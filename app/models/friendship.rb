class Friendship < ApplicationRecord
  belongs_to :user
  #It belongs to friend, but the class name isn't friend, but User, again referring back to itself.
  belongs_to :friend, class_name: 'User'
end
