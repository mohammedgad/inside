require "rails_helper"

RSpec.describe Student, type: :model do
  it "has a uniqe name" do
    student1 = create(:student)
    student2 = build(name: student1.name)
    expect(student2.valid?).to eq(false)
  end
end