class Coach < ApplicationRecord
  #Relations
  has_and_belongs_to_many :students

  #Validations
  validates_uniqueness_of :name, on: [:create, :update], message: "must be unique"
  validates_presence_of :name, on: [:create, :update], message: "can't be blank"
  validates_presence_of :cap, on: [:create, :update], message: "can't be blank"
  validates :cap, numericality: true
  validate :check_cap, on: [:create, :update]

  #Scopes
  scope :high_cap, -> { where(cap: Coach.maximum(:cap)).first }

  #Instance Methods
  def check_cap
    errors.add(:cap, "total precentage exceeded 100%") if !self.cap.nil? && (Coach.sum(:cap) + self.cap) > 100
  end
end
