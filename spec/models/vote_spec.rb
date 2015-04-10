require 'rails_helper'

RSpec.describe Vote, type: :model do
  let!(:user) {User.create!(name: 'VanVan',location: 'Cuba',username: 'aquinomas',password: 'aquinomas')}
  let!(:lionking) {User.create!(name: 'lionking',location: 'tanzania',username: 'lionking',password: 'lionking')}
  let(:question) {Question.new(title: "Fake answer", body: "Some text", user: user)}
  let(:answer) {Answer.new( body: "Some text", question: question, user: user)}

  describe "#validations" do

  	it "User cannot vote on own questions or answers" do
  		question.save
    	answer.save
      expect{answer.votes.create(user: user)}.to_not change{Vote.count}	     
    end

    it "vote of valid user on questions or answers should increase vote count" do
    	question.save
    	answer.save
      expect{answer.votes.create(user: lionking)}.to change{Vote.count}.by(1)
    end 
  end
end
