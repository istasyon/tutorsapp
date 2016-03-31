class TimeslotsController < ApplicationController
  def index
  	@timeslots = [{ start: "20:00",
    end: "24:00" , dow: [0], rendering: 'background'},{ start: "03:00",
  	end: "08:00" , dow: [1], rendering: 'background'}, { start: "06:00",
    end: "14:00" , dow: [2], rendering: 'background'}, { start: "14:00",
    end: "18:00" , dow: [3], rendering: 'background'}, { start: "00:00",
    end: "06:00" , dow: [4], rendering: 'background'}, { start: "10:00",
    end: "20:00" , dow: [5], rendering: 'background'}, {
        title:"BOOKED",
        start: 'Mon Apr 7 2016 10:00:00',
        end: 'Mon Apr 7 2016 14:00:00', 
        color: 'black'
      }, {
        title:"UNAV",
        start: 'Mon Apr 5 2016 10:00:00', 
        end: 'Mon Apr 5 2016 16:00:00',
        color: 'grey'
      }]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @timeslots }
    end
  end

  def new
  end

  def edit
  end
end
