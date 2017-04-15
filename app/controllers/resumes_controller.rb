class ResumesController < ApplicationController
  before_action :authenticate_user!

  def new
    @exam = Exam.find(params[:exam_id])
    @resume = Resume.new
  end

  def create
    @exam = Exam.find(params[:exam_id])
    @resume = Resume.new(resume_params)
    @resume.exam = @exam
    @resume.user = current_user

    if @resume.save
      current_user.apply!(@exam)
      flash[:notice] = "成功提交你的信息"
      redirect_to exam_path(@exam)
    else
      render :new
    end
  end


  private

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end
end
