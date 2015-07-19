class Disease < ActiveRecord::Base
  has_many :user_diseases
  has_many :users, through: :user_diseases
  validates_uniqueness_of :name
end
