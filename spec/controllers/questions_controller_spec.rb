require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let!(:user) {User.create!(name: 'VanVan',location: 'Cuba',username: 'aquinomas',password: 'aquinomas')}
  let!(:question) {Question.create!(title: "Test title", body: "Test body", user_id: 1)}

  describe "GET #index" do
    it "assigns all questions to @questions" do
      get :index
      expect(assigns(:questions)).to include(question)
    end
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested question to @question" do
      get :show, {id: question.to_param}
      assigns(:question).should eq(question)
    end

    it "renders the #show view" do
      get :show, { id: question.to_param  }
      response.should render_template :show
    end
  end

  describe "DELETE destroy" do
    it "deletes the question" do
      expect{
        delete :destroy, {id: question.to_param}
      }.to change(Question, :count).by(-1)
    end
  end

end
