module ExamsHelper

  def render_exam_status(exam)
    if exam.is_hidden
      "(Hidden)"
    else
      "(Public)"
    end
  end
end
