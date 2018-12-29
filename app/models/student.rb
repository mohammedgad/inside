class Student < ApplicationRecord
  #Relations
  has_and_belongs_to_many :coaches

  #Validations
  validates_presence_of :name, on: [:create, :update], message: "can't be blank"
  validates_uniqueness_of :name, on: [:create, :update], message: "must be unique"

  #Callbacks
  before_save :assign_to_coach

  #Instance Methods
  def assign_to_coach
    high_cap = Coach.high_cap
    high_cap_students = high_cap.students.count
    assigned = false
    Coach.where.not(id: high_cap.id).order(cap: :desc).each do |c|
      current_cap = c.cap
      perfect_num = (high_cap_students * current_cap) / high_cap.cap #Number of students the coach should have
      if c.students.count < perfect_num
        self.coaches << c
        assigned = true
        break
      end
    end
    if !assigned
      self.coaches << high_cap
    end
  end

end
