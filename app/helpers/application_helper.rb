module ApplicationHelper

  def full_title(page_title = "")
    if page_title == ""
      "Flight Booker"
    else
      "#{page_title} | Flight Booker"
    end
  end
end
