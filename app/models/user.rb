class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end

  def has_applied?(exam)
    applied_exams.include?(exam)
  end

  def apply!(exam)
      applied_exams << exam
  end


  has_many :resumes
  has_many :exam_relationships
  has_many :applied_exams, :through => :exam_relationships, :source => :exam
end
