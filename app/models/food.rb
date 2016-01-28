class Food < ActiveRecord::Base
  has_many :users
end
