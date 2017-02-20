class PlacesController < ApplicationController
  require 'beermapping_api'
  def index
  end

  def search
    city = params[:city]
    @places = BeermappingApi.places_in(city)
    @weather = WeatherService.weather_for(city)
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      session[:last_city] = params[:city]
      render :index
    end

  end
  def show
    places_in_cache = Rails.cache.read(session[:last_city])
    @place_to_show = places_in_cache.find{|pl| pl.id == params[:id]}
  end
end