module SemestersHelper
  # Returns a hash with information about the open/close status of the
  # store, based on the time/date of inquiry.
  def store_status
    status = Hash[status: "CLOSED"]
    
    now = Time.now
    day_of_the_year = now.yday
    day_of_the_week = now.wday
    hour = now.hour
    
    year = now.year
    semester = 183 < day_of_the_year # False => Spring, True => Fall
    
    semester_info = Semester.where("year = ? AND semester = ?", year, semester).first
    
    if day_of_the_year.between?(semester_info.first_day, semester_info.last_day)
      if day_of_the_week.between? 1, 6 # weekday?
        if hour.between? 10, 15
          status.update({ status: "OPEN" })
        elsif hour.between? 4, 9
          status.update({ message: "We will be open today at 10am." })
        elsif day_of_the_week != 6
          status.update({ message: "We are currently closed for the day, please come back tomorrow!" })
        else
          status.update({ message: "We are currently closed for the day, please come back next week!" })
        end
      else
        status.update({ message: "We are currently closed, please come visit us after the weekend." })
      end
    else
      status.update({ message: "We will be closed until the start of the next semester." })
    end
  end
end
