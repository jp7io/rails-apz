class WeatherUpdateJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    Weather.write
  end
end
