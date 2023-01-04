class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update edit destroy hide]
  before_action :set_question_for_current_user, only: %i[update edit destroy hide]

  def create
    question_params = params.require(:question).permit(:body, :user_id)

    @question = Question.new(question_params)

    @question.author = current_user

    if @question.save
      redirect_to user_path(@question.user), notice: 'Новый вопрос создан!'
    else
      flash.now[:alert] = "Вы неправильно заполнили поля формы вопроса"

      render :new
    end
  end

  def update
    question_params = params.require(:question).permit(:body, :answer)

    if @question.update(question_params)
      redirect_to user_path(@question.user), notice: 'Вопрос обновлён!'
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
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: 'Вопрос удален!'
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.order(created_at: :desc).first(10)
    @tags = Tag.all.map(&:name).each { |tag| tag.prepend("#") }.join(", ")
    @users = User.order(created_at: :desc).last(10)
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
  end

  def edit; end

  def hashtags
    @tag = Tag.find_by!(name: params[:name].downcase)
    @questions = @tag.questions
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end
end
