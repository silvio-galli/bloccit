class QuestionsController < ApplicationController
  
  def index
  	@questions = Question.all
  end


  def show
  	@question = Question.find(params[:id])
  end


  def new
  	@question = Question.new
  end


  def create
    @question = Question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]

    if @question.save
      flash[:notice] = "New Question was saved."
      redirect_to @question
    else
      flash[:error] = "There was an error saving the question. Please try again."
      render :new
    end
  end


  def edit
  	@question = Question.find(params[:id])
  end


  def update
  	@question = Question.find(params[:id])
  	@question.title = params[:question][:title]
  	@question.body = params[:question][:body]
  	@question.resolved = params[:question][:resolved]

  	if @question.save
  		flash[:notice] = "Question n. #{@question.id} was successfully updated."
  		redirect_to @question
  	else
  		flash[:error] = "Something went wrong. The question n. #{@question.id} wasn't updated."
  		render :edit
  	end
  end

  def destroy
  	@question = Question.find(params[:id])

  	if @question.delete
      flash[:notice] = "Question #{@question.id} was successfully deleted."
      redirect_to questions_path
    else
      flash[:error] = "Something went wrong. Question wasn't deleted."
      render :show
  	end
  end


end
