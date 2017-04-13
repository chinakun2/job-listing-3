class Admin::ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  layout 'admin'

  def index
    @exam = Exam.find(params[:exam_id])
    @resumes = @exam.resumes.order('created_at DESC')
  end
end
