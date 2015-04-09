class IndexController < ApplicationController
  
  def index
    @questions = Question.all
  end

end