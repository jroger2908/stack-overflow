require 'faker'

vanvan = User.create(name: 'VanVan',
		     location: 'Cuba',
		     username: 'aquinomas',
		     password_digest: 'aquinomas')

vanvan = User.all.first

10.times do 
	vanvan.questions.create(title: Faker::Lorem.sentence,
		                       body: Faker::Lorem.paragraph)
end

Question.all.each do |question|
	3.times do
	 question.answers.create(title: Faker::Lorem.sentence,
			                     body: Faker::Lorem.paragraph,
			                     user: vanvan)
	end
end




