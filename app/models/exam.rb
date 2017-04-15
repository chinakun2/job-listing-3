class Exam < ApplicationRecord
  validates :title, presence: true

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  has_many :resumes
  has_many :exam_relationships
  has_many :members, through: :exam_relationships, source: :user
end
