class VotesController < ApplicationController
	before_action :set_votable

	def create
		vote = Vote.find_by(user: current_user,
		                    votable_id: @votable.id,
		                    votable_type: @votable.class.name)

		if vote
		vote.update_attributes(score: 1)
		else
		    @votable.votes.create(user: current_user,
		                         votable_id: @votable.id,
		                         votable_type: @votable.class.name,
		                         score: 1)
		end
		redirect_to question_path(params[:question_id])
	end

	def destroy
		vote = Vote.find_by(user: current_user,
		                    votable_id: @votable.id,
		                    votable_type: @votable.class.name)
		if vote
		vote.update_attributes(score: -1)
		else
		    @votable.votes.create(user: current_user,
		                         votable_id: @votable.id,
		                         votable_type: @votable.class.name,
		                         score: -1)
		end
		redirect_to question_path(params[:question_id])
	end

	protected

	def set_votable
		@votable = Question.find_by(id: params[:question_id])
		@votable = Answer.find_by(id: params[:answer_id]) if params[:answer_id]
	end
end