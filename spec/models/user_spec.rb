require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it "is invalid without name" do
    expect(FactoryGirl.build(:user, name: nil)).to be_invalid
  end

  it "is invalid without username" do
    expect(FactoryGirl.build(:user, username: nil)).to be_invalid
  end

  it "is invalid without password" do
    expect(FactoryGirl.build(:user, password: nil)).to be_invalid
  end

  it "must have a password 4 characters or longer" do
    expect(FactoryGirl.build(:user, password: "123")).to be_invalid
  end

  it "requires a unique username" do
    User.create(name: "Marcelina Rutherford", location: "Martinique", username: "neko1234", password: "metalhead")
    dupe = User.create(name: "Abigail Winthrop", location: "Costa Rica", username: "neko1234", password: "babes")
    expect(dupe).to be_invalid
  end

end


# Password must be 4+ characters
