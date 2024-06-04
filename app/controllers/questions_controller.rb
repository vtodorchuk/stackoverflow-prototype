class QuestionsController < ApplicationController
  before_action :load_question, only: %w[show edit update destroy]

  def index
    @questions = Question.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(questions_params)

    if @question.save
      redirect_to @question
    else
      redirect_to new_question_path, alert: @question.errors.full_messages
    end
  end

  def update
    if @question.update(questions_params)
      redirect_to @question
    else
      redirect_to edit_question_path, alert: @question.errors.full_messages
    end
  end

  def destroy
    if @question.destroy
      redirect_to questions_path
    else
      redirect_to @question
    end
  end

  def edit; end

  def show; end

  private

  def load_question
    @question = Question.find(params[:id])
  end

  def questions_params
    params.require(:question).permit(%w[title body])
  end
end
