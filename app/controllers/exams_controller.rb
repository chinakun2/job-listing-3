class ExamsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @exams = Exam.where(:is_hidden => false).order("created_at DESC")
  end

  def show
    @exam = Exam.find(params[:id])

    if @exam.is_hidden
      flash[:warning] = "This examination already archieved"
      redirect_to root_path
    end
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)

    if @exam.save
      redirect_to exams_path
    else
      render :new
    end
  end

  def edit
    @exam = Exam.find(params[:id])
  end

  def update
    @exam = Exam.find(params[:id])

    if @exam.update(exam_params)
      redirect_to exams_path
    else
      render :edit
    end
  end

  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy

    redirect_to exams_path
  end

  private

  def exam_params
    params.require(:exam).permit(:title, :description, :is_hidden)
  end
end
