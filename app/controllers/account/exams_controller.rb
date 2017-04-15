class Account::ExamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @exams = current_user.applied_exams
  end
end
