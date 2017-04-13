module ExamsHelper
  def render_exam_status(exam)
    if exam.is_hidden
      content_tag(:span, "", :class => "fa fa-lock")
    else
      content_tag(:span, "", :class => "fa fa-globe")
    end
  end

end
