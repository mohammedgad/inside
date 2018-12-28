class Student < ApplicationRecord
  #Relations
  has_and_belongs_to_many :coaches

  #Validations
  validates_presence_of :name, on: [:create, :update], message: "can't be blank"
end
