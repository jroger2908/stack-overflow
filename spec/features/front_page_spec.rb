describe "everything" do
  let!(:user) {User.create!(name: "jose", location: "colombia", username: "jose", password: "colombia") }
  before do
    visit '/session/new'
    fill_in 'Username', :with => 'jose'
    fill_in 'Password', :with => 'colombia'
    click_button "Sign in"
  end

  describe "the front page", :type => :feature do
    it "should show the front page" do
      visit '/'
      expect(page).to have_content 'Top Questions'
    end
  end

  describe "The Front Page" do
    it "should have a button that will take us to a page to submit a new question" do
      visit '/'
      click_link 'Ask a Question'
      expect(page).to have_css ('#create-question-btn')
    end
  end

   describe "Clicking All Questions" do
    it "should take you to view all questions" do
      visit '/'

      click_link ('All Questions')
      expect(page).to have_content('All Questions')
    end
  end

  describe "Create Question Page" do

    it "visit ask question form" do
      visit '/questions/new'

      within(".new_question") do
        fill_in 'Title', :with => 'Title of post'
        fill_in 'Body', :with => 'This is the body of a post'
      end

      click_button 'Create Question'
      question_body = page.find('p.question-body')
      expect(question_body).to have_content ('This is the body of a post')
    end
  end

  describe "Create an answer to a question" do

    let!(:question) {Question.create!(title: "Test title", body: "Test body", user: user)}
   
    it "visit ask question form" do
      visit '/questions/1'

      within("#new_answer") do
        fill_in 'answer[body]', :with => 'I am answering the question'
      end

      click_button 'Create Answer'
      answer_body = page.all('p.answer').last
      expect(answer_body).to have_content ('I am answering the question')
    end
  end

end



