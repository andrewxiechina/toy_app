module ApplicationHelper
  def translateToTitle(title = "")
    if title.empty?
      return "Andrew Xie - The Pro Problem Solver"
    else
      return title + " | " + "Ruby on Rails Tutorial Sample App"
    end
  end
end
