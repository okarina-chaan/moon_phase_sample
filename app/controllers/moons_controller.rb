class MoonsController < ApplicationController
  def index
   today = Date.today
    @moon_age = MoonService.age(today)
    @moon_phase = MoonService.phase_name(@moon_age)
    @today = today
  end

  def show
     @moon = MoonApiService.fetch(Date.today)
  end
end
