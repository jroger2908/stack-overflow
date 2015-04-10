require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let!(:user) {User.create!(name: 'VanVan',location: 'Cuba',username: 'aquinomas',password: 'aquinomas')}
  let!(:question) {Question.create!(title: "Test title", body: "Test body", user: user)}
  let!(:test_answer) {Answer.create!(body: "Stuff in the body", question: question, user: user) }

  describe "POST create" do
    context "with valid attributes" do
      xit "creates a new answer" do
        expect{
          post :create, { answer: {body: "Answering the question", question: question, user: user}.to_param}
        }.to change(Answer,:count).by(1)
      end
      
      xit "redirects to the same question page" do
        post :create, contact: Factory.attributes_for(:contact)
        response.should redirect_to Contact.last
      end
    end
    
    context "with invalid attributes" do
      xit "does not save the new answer" do
        expect{
          post :create, contact: Factory.attributes_for(:invalid_contact)
        }.to_not change(Contact,:count)
      end
      
    end 
  end

  describe "DELETE destroy" do
    it "deletes the answer" do
      expect{
        delete :destroy, {id: test_answer.to_param, question_id: test_answer.question.to_param}
      }.to change(Answer, :count).by(-1)
    end
  end

end
