require 'rails_helper'

RSpec.describe Question, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:question)).to be_valid
  end

  it "is invalid without title" do
    expect(FactoryGirl.build(:question, title: nil)).to be_invalid
  end

  it "can't have a title longer than 80 characters" do
    expect(FactoryGirl.build(:question, title: Faker::Lorem.characters(81))).to be_invalid
  end

  it "is invalid without body" do
    expect(FactoryGirl.build(:question, body: nil)).to be_invalid
  end

  it "is invalid without user" do
    expect(FactoryGirl.build(:question, user: nil)).to be_invalid
  end

end
