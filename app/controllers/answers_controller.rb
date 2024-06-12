class AnswersController < ApplicationController
  def create
    @answer = question.answers.new(answers_params)

    if @answer.save
      redirect_to question
    else
      redirect_to question, alert: @answer.errors.full_messages
    end
  end

  def update
    if answer.update(answers_params)
      redirect_to question
    else
      redirect_to question, alert: answer.errors.full_messages
    end
  end

  def destroy
    if answer.destroy
      redirect_to question
    else
      redirect_to question, alert: answer.errors.full_messages
    end
  end

  private

  def question
    @question ||= Question.find_by(id: params[:question_id])
  end

  def answers_params
    params.require(:answer).permit(:body)
  end

  def answer
    @answer ||= question.answers.find_by(id: params[:id])
  end
end
