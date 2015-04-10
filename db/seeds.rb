require 'faker'

vanvan = User.create!(name: 'VanVan',
		     location: 'Cuba',
		     username: 'aquinomas',
		     password: 'aquinomas')



10.times do
	vanvan.questions.create!(title: Faker::Lorem.sentence(2),
		                       body: Faker::Lorem.paragraph(4))
end

Question.all.each do |question|
	3.times do
	 question.answers.create!(body: Faker::Lorem.paragraph(2),
			                     user: vanvan)
	end
end


lionking = User.create!(name: 'lionking',
		     location: 'tanzania',
		     username: 'lionking',
		     password: 'lionking')


10.times do
	lionking.questions.create!(title: Faker::Lorem.sentence(2),
		                       body: Faker::Lorem.paragraph(4))
end

Question.all.each do |question|
	3.times do
	 question.answers.create!(body: Faker::Lorem.paragraph(2),
			                     user: lionking)
	end
end




