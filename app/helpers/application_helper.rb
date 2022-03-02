module ApplicationHelper
  def should_show_bar?
    params[:controller] == 'questions'
  end
end
