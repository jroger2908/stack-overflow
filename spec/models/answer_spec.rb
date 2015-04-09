require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:test_question) {Question.new(title: "Fake answer", body: "Some text", user_id: 1)}
  let(:answer) {Answer.new(title: "Fake answer", body: "Some text", question: test_question, user_id: 2)}

  describe "#validations" do
    it "has a title" do
      expect(answer.title).to eq("Fake answer")
    end

    it "has a answer body" do
      expect(answer.body).to eq("Some text")
    end

    it "has a question id" do
      expect(answer.question_id).to eq(1)
    end

    it "has a user id" do
      expect(answer.user_id).to eq(2)
    end
  end
end
