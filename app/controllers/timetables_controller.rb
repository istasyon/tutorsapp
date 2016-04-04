class TimetablesController < ApplicationController
  def show
    @availabilities = to_dow User.find(params[:user_id]).timetable
    @appointments =  [{
        title:"BOOKED",
        start: "Mon, 05 Apr 2016 06:00:00 UTC +00:00",
        end: "Mon, 05 Apr 2016 09:00:00 UTC +00:00", 
        color: 'black'
      }, {
        title:"BOOKED",
        start: 'Mon, 06 Apr 2016 06:00:00 UTC +00:00', 
        end: 'Mon, 06 Apr 2016 09:00:00 UTC +00:00',
        color: 'grey'
      }]
      @timeslots = @appointments + @availabilities
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @timeslots }
    end
  end


  def new
  end

  def edit
  end

def left_circular_shift(bit_string, n) 
    n.times do 
      var = bit_string[1..-1]
      var << bit_string[0]
      bit_string = var
    end
    bit_string
  end

  def right_circular_shift(bit_string, n)
    n.times do
      var = bit_string[0..670]
      var.insert(0, bit_string[671])
      bit_string = var
    end  
    bit_string
  end

  def convert_available_hours(all, from_zone, to_zone)
    if from_zone < to_zone
      right_circular_shift(all, ((to_zone - from_zone)*4).to_i)
    elsif from_zone > to_zone
      left_circular_shift(all, ((from_zone - to_zone)*4).to_i)
    else
      all
    end   
  end

  def timezone_to_float(timezone_offset)
    if timezone_offset[0] == "-"
      sign = -1
    else
      sign = 1
    end  

    hour = timezone_offset[1,2].to_i
    min = timezone_offset[4,5]
    if min == "15"
      floating = 0.25
    elsif min == "30"
      floating = 0.50
    elsif min == "45"
      floating = 0.75    
    else
      floating = 0
    end
    sign * (hour + floating )
  end

  def to_dow (bit_string)
    all_array= bit_string.scan(/.{96}/)
    starts = []
    ends = []
    d = 0
    y= 0
    all_hash = []
    hours = ["00:00", "00:15", "00:30", "00:45", "01:00", "01:15", "01:30", "01:45", "02:00", "02:15", 
             "02:30", "02:45", "03:00", "03:15", "03:30", "03:45", "04:00", "04:15", "04:30", "04:45", 
             "05:00", "05:15", "05:30", "05:45", "06:00", "06:15", "06:30", "06:45", "07:00", "07:15", 
             "07:30", "07:45", "08:00", "08:15", "08:30", "08:45", "09:00", "09:15", "09:30", "09:45", 
             "10:00", "10:15", "10:30", "10:45", "11:00", "11:15", "11:30", "11:45", "12:00", "12:15", 
             "12:30", "12:45", "13:00", "13:15", "13:30", "13:45", "14:00", "14:15", "14:30", "14:45", 
             "15:00", "15:15", "15:30", "15:45", "16:00", "16:15", "16:30", "16:45", "17:00", "17:15", 
             "17:30", "17:45", "18:00", "18:15", "18:30", "18:45", "19:00", "19:15", "19:30", "19:45", 
             "20:00", "20:15", "20:30", "20:45", "21:00", "21:15", "21:30", "21:45", "22:00", "22:15", 
             "22:30", "22:45", "23:00", "23:15", "23:30", "23:45", "24:00"]
    while d < 7
      i = 0
      while i<96

        if (all_array[d][i] == "1")
          start_index = i
          end_index = i + 1
          starts << start_index
          ends << end_index
          i += 1
          while (all_array[d][i] == "1") do
            end_index = i + 1
            ends.pop
            ends << end_index
            i += 1
          end 
        end 
        i += 1
      end
       for f in y..(ends.length-1) do
        all_hash << {start: hours[starts[f]], 'end' => hours[ends[f]], dow: [d], rendering: 'background'}
       end
       y = ends.length
       d += 1
      
    end
    all_hash
  end   

end
