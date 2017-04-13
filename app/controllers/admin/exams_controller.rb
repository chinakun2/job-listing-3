class Admin::ExamsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin
  layout "admin"

  def show
    @exam = Exam.find(params[:id])
  end

  def index
    @exams = Exam.all
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)

    if @exam.save
      redirect_to admin_exams_path
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
      redirect_to admin_exams_path
    else
      render :edit
    end
  end

  def destroy
    @exam = Exam.find(params[:id])

    @exam.destroy

    redirect_to admin_exams_path
  end

  def publish
    @exam = Exam.find(params[:id])
    @exam.publish!
    redirect_to :back
  end

  def hide
    @exam = Exam.find(params[:id])
    @exam.hide!
    redirect_to :back
  end

  private

  def exam_params
    params.require(:exam).permit(:title, :description, :is_hidden)
  end
end
