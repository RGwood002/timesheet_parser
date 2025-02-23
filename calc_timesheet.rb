require 'csv'
require_relative 'TimeSheetEntry'

def read(filepath)
    conv_time_sheet = [] 
    arr_of_rows = CSV.read(filepath)[1..-1]
    arr_of_rows.each{ |x| entry = TimeSheetEntry.new(x[0],x[1],x[2],x[3],x[4],x[5])
    conv_time_sheet.push(entry)  
    }

    conv_time_sheet
end

times = read('timesheet.csv')
total_seconds = times.reduce(0) {|sum, index| sum + index.seconds_work}
puts total_seconds

hours = (total_seconds/3600).floor
min = ((total_seconds%3600)/60).floor


puts "Worked for " + hours.to_s + " hours and " + min.to_s + " minutes!"