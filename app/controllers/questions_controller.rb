class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]

    if @question.save
      flash[:notice] = "Your Q has been saved."
      redirect_to @question
    else
      flash.now[:error] = "Your Q was bogus. Try again!"
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    if @question.save
      flash[:notice] = "Your Q has been saved."
      redirect_to @question
    else
      flash.now[:error] = "Your Q was bogus. Try again!"
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])

    if @question.destroy
      flash[:notice] = "Your Q has been deleted succesfully."
      redirect_to questions_path
    else
      flash.now[:alert] = "Your Q could not be deleted."
      render :show
    end
  end
end
