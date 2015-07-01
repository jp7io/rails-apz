class WeatherController < ApplicationController

  def show
    render json: Weather.fetch
  end

  def update
    Weather.write
    redirect_to weather_url
  end

end
