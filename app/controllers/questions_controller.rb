class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update show edit destroy hide]

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to question_path(@question), notice: 'Новый вопрос создан!'
    else
      flash.now[:alert] = "Вы неправильно заполнили поля формы вопроса"

      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question), notice: 'Вопрос обновлён!'
    else
      flash.now[:alert] = "При попытке обновить вопрос возникли ошибки"

      render :edit
    end
  end

  def hide
    @question.toggle :hidden
    @question.save

    redirect_to question_path(@question)
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: 'Вопрос удален!'
  end

  def show; end

  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
    @question = Question.new
  end

  def edit; end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
