module ApplicationHelper
  def s_to_title(title="")
    if title.empty?
      return "Ruby on Rails Tutorial Sample App"
    else
      return title + " | Ruby on Rails Tutorial Sample App"
    end
  end
end
