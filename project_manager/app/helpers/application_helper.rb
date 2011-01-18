module ApplicationHelper

  def f_date(date)
    if date
      return date.strftime("%x")
    end
  end

end
