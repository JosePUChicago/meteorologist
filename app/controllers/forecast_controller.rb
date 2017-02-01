require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("forecast/coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================

    @c_to_wurl = "https://api.darksky.net/forecast/d5625fe2e40ae929fd1f31ea2269f7af/#{@lat},#{@lng}"
    @parsecw_data= JSON.parse(open(@c_to_wurl).read)
    @current_temperature = @parsecw_data["currently"]["temperature"]

    @current_summary = @parsecw_data["currently"]["summary"]
    @summary_of_next_sixty_minutes = @parsecw_data["minutely"]["summary"]

    @summary_of_next_several_hours = @parsecw_data["hourly"]["summary"]

    @summary_of_next_several_days = @parsecw_data["daily"]["summary"]

    render("forecast/coords_to_weather.html.erb")
  end
end
