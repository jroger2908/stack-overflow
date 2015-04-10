require 'rails_helper'

RSpec.describe UsersController, type: :controller do
let!(:user) {User.create!(name: 'VanVan',location: 'Cuba',username: 'aquinomas',password: 'aquinomas')}
let!(:lionking) {User.create!(name: 'lionking',location: 'tanzania',username: 'lionking',password: 'lionking')}
let!(:question) {Question.create!(title: "Test title", body: "Test body", user: user)}
let!(:question_test) {Question.create!(title: "Test title", body: "Test body", user: lionking)}
let!(:answer) {Answer.create( body: "Some text", question: question, user: user)}
  
  describe "GET #show" do

  	it "ir should render the shoe template" do 
      get :show, {id: user.to_param}
      response.should render_template :show
    end

    it "assigns all user questions to @questions" do
      get :show, {id: user.to_param}
      expect(assigns(:questions)).to include(question)
    end

    it "assigns all a to answers to @answers" do
      get :show, {id: user.to_param}
      expect(assigns(:answers)).to include(answer)
    end
  end

  describe "GET #new" do
    it "renders the new sing up page" do 
      get :new
      response.should render_template :new
    end
  end

  # describe "POST #create" do
  #   it "renders the new vire" do 
  #     User.stub(:new) { mock_account(:save => true) }
	 #  post :create, :user => {name: 'tigre',
	 #  	                      location: 'amazonas',
	 #  	                      username: 'tigre',
	 #  	                      password: 'tigre' }
	 #  # expect(response).to redirect_to(assigns(:widget))
	 #  # follow_redirect!
	 #  # expect(response).to render_template(:show)
	 #  # # expect(response.body).to include("Widget was successfully created.")
  #   end
  # end
   
  # describe "DELETE #destroy" do
   
  # end
 

end
