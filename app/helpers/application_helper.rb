module ApplicationHelper
  def appointment_time(hour, min)
    # on page load assume time zone is Pacific
    start_hour =  hour - 8
    start_min = '30'
    if min == 0
      start_min = '00'
    end
    start_am_pm = 'AM'
    if start_hour > 11
      start_am_pm = 'PM'
      if start_hour > 12
        start_hour -= 12
      end
    end
    end_hour =  hour - 8
    end_min = '00'
    if min == 0
      end_min = '30'
    else
      end_hour += 1
    end
    end_am_pm = 'AM'
    if end_hour > 11
      end_am_pm = 'PM'
      if end_hour > 12
        end_hour -= 12
      end
    end

    formatted = start_hour.to_s + ':' + start_min + start_am_pm + ' - ' + end_hour.to_s + ':' + end_min + end_am_pm
  end
end
