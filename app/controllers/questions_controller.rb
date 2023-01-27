class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update show destroy edit hide]
  def create 
    @question = Question.new(question_params)

    if @question.save
      redirect_to question_path(@question), notice: 'Новый вопрос создан!'
    else
      flash.now[:alert] = 'Вопрос не должен быть пустым, а его максимальная длина - 280 символов!'
      render :new
    end
  end

  def update
    @question.update(question_params)

    redirect_to question_path(@question), notice: 'Сохранили вопрос!'
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: 'Вопрос удалён!'
  end

  def show
  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
  end
  
  def hide
    @question.update(hidden: true)

    redirect_to questions_path, notice: 'Вопрос скрыт!'
  end
  
  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
