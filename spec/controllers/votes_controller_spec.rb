require 'rails_helper'

RSpec.describe VotesController, type: :controller do
  let!(:user) {User.create!(name: 'VanVan',location: 'Cuba',username: 'aquinomas',password: 'aquinomas')}
  let!(:lionking) {User.create!(name: 'lionking',location: 'tanzania',username: 'lionking',password: 'lionking')}
  let!(:question) {Question.create(title: "Fake answer", body: "Some text", user: user)}
  let!(:answer) {Answer.create( body: "Some text", question: question, user: user)}

  describe "DELETE #destroy" do
 

    it "deletes makes the vote count for the votable to go down 1" do
      expect{
        post :create, {question_id: question.to_param, answer_id: answer.to_param}
        
      }.to change{answer.vote_count}.by(1)
    end
    
    #  it "deletes makes the vote count for the votable to go down 1" do
    #   expect{
    #     delete :destroy, {question_id: question.to_param, answer_id: answer.to_param}
    #   }.to change{answer.vote_count}.by(-1)
    # end


    # it "deletes makes the vote count for the votable to go down 1" do
    #   expect{
    #     delete :destroy, {id: question.to_param}
    #   }.to change(question.vote_count, :count).by(-1)
    # end

  end




  # describe "POST #create" do
  # 	 t "deletes makes the vote count for the votable to go up 1" do
  #     expect{
  #       delete :destroy, {id: question.to_param}
  #     }.to change(answer.vote_count, :count).by(-1)
  #   end
  
  # end
end
