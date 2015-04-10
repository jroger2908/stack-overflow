require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) {User.create!(name: 'VanVan',location: 'Cuba',username: 'aquinomas',password: 'aquinomas')}
  let!(:question) {Question.create!(title: "Test title", body: "Test body", user: user)}
  let!(:lionking) {User.create!(name: 'lionking',location: 'tanzania',username: 'lionking',password: 'lionking')}
  let!(:answer) {Answer.create( body: "Some text", question: question, user: user)}

  describe "GET #show" do
    it "assigns all user questions to @questions" do
      get :show, {id: user.to_param}
      expect(assigns(:questions)).to include(question)
    end
     
     it "assigns all user answers to @answers" do
      get :show, {id: user.to_param}
      expect(assigns(:answers)).to include(answer)
    end


    it "renders the :index show" do
      get :show, {id: user.to_param}
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "renders the :index new" do
      get :new
      response.should render_template :new
    end
  end

   describe "POST #create" do
    let!(:user_new) {User.new(name: 'user_new',location: 'tanzania',username: 'user_new',password: 'user_new')}
    
    # it "on valid user input redictes to user profile page" do
    #   get :create, {}
    #   response.should render_template :new
    # end

    it "on invalid user renders new" do

      get :create, user: user_new.attributes.except("id")
      response.should render_template :new
    end
    
  end
  
  
  


end
