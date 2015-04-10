require 'rails_helper'

RSpec.describe Answer, type: :model do
  let!(:user) {User.create!(name: 'VanVan',location: 'Cuba',username: 'aquinomas',password: 'aquinomas')}
  let(:test_question) {Question.new(title: "Fake answer", body: "Some text", user: user)}
  let(:answer) {Answer.new(body: "Some text", question: test_question, user: user)}

  describe "#validations" do

    it "has a answer body" do
      expect(answer.body).to eq("Some text")
    end

    it "has a question id" do
      expect(answer.question).to eq(test_question)
    end

    it "has a user id" do
      expect(answer.user_id).to eq(1)
    end
  end
end
