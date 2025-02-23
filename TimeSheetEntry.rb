class TimeSheetEntry
  
  def initialize(date, day, start_time, end_time, lunch_start, lunch_end)
    @date = date
    @day = day
    @start_time = Time.strptime(start_time, '%l:%M %p')
    @end_time = Time.strptime( end_time, '%l:%M %p')
    @lunch_start = lunch_start.nil? || lunch_start.strip.empty? ? '' : Time.strptime( lunch_start, '%l:%M %p')
    @lunch_end = lunch_end.nil? || lunch_end.strip.empty? ? '' : Time.strptime( lunch_end, '%l:%M %p')
  end

  def display_date
    puts @date
  end
  
  def hours_worked
    total_time = @end_time - @start_time
    lunch_total = @lunch_start == '' ? 0 : @lunch_end - @lunch_start
    diff_in_seconds = total_time - lunch_total
    puts diff_in_seconds
    hours = (diff_in_seconds/3600).floor
    min = ((diff_in_seconds%3600)/60).floor


    puts "Worked for " + hours.to_s + ":" + min.to_s + " on " + @date
    hours
  end

  def seconds_work
    total_time = @end_time - @start_time
    lunch_total = @lunch_start == '' ? 0 : @lunch_end - @lunch_start
    diff_in_seconds = total_time - lunch_total

    diff_in_seconds
  end


end