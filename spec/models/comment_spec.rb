require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) {User.create!(name: 'VanVan',location: 'Cuba',username: 'aquinomas',password: 'aquinomas')}
  let(:question) {Question.create(title: "Fake answer", body: "Some text", user: user)}
  let(:answer) {Answer.create( body: "Some text", question: question, user: user)}

  describe "#validations" do

  	it "is invalid when comment is not associated to a question or answer" do
        expect{Comment.create(user: user,content: Faker::Lorem.paragraph(4))}.to_not change{Comment.count}	
        expect{Comment.create(user: user,content: Faker::Lorem.paragraph(4))}.to_not change{Comment.count}	      
    end

    it "is invalid when no content is given" do
        expect{answer.comments.create(user: user)}.to_not change{Comment.count}	
        expect{question.comments.create(user: user)}.to_not change{Comment.count}	      
    end

    it "is invalid when no user is given" do
        expect{answer.comments.create(content: Faker::Lorem.paragraph(4))}.to_not change{Comment.count}
        expect{question.comments.create(content: Faker::Lorem.paragraph(4))}.to_not change{Comment.count}
    end

     it "to change vote count when valid commemt is issue" do
        expect{answer.comments.create(user: user,content: Faker::Lorem.paragraph(4))}.to change{Comment.count}.by(1)  
        expect{question.comments.create(user: user,content: Faker::Lorem.paragraph(4))}.to change{Comment.count}.by(1)                                 
    end


  end
end
