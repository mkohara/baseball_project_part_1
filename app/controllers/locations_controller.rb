class LocationsController < ApplicationController

  def address_to_geo(address)
  require 'open-uri'
  url = 'http://maps.googleapis.com/maps/api/geocode/json?address=' + URI.encode(address)
  parsed_data = JSON.parse(open(url).read)
  lat = parsed_data["results"][0]["geometry"]["location"]["lat"]
  lng = parsed_data["results"][0]["geometry"]["location"]["lng"]
  return [lat,lng]
  end

  def index
    @q = Location.ransack(params[:q])
    @locations = @q.result(:distinct => true).includes(:schedules, :teams).page(params[:page]).per(10)

    render("locations/index.html.erb")
  end

  def show_map
    @location=Location.all
  end

  def show
    @team = Team.new
    @schedule = Schedule.new
    @location = Location.find(params[:id])

    render("locations/show.html.erb")
  end

  def new
    @location = Location.new

    render("locations/new.html.erb")
  end

  def create
    @location = Location.new

    @location.field = params[:field]
    @location.name = params[:name]
    @location.details = params[:details]
    @location.address =params[:address]

    latlng = address_to_geo(params[:address])
    @location.lat = latlng[0]
    @location.lng = latlng[1]

    save_status = @location.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/locations/new", "/create_location"
        redirect_to("/locations")
      else
        redirect_back(:fallback_location => "/", :notice => "Location created successfully.")
      end
    else
      render("locations/new.html.erb")
    end
  end

  def edit
    @location = Location.find(params[:id])

    render("locations/edit.html.erb")
  end

  def update
    @location = Location.find(params[:id])

    @location.field = params[:field]
    @location.name = params[:name]
    @location.details = params[:details]
    @location.address =params[:address]

    @location.lat = params[:lat]
    @location.lng = params[:lng]
    latlng = address_to_geo(params[:address])
    @location.lat = latlng[0]
    @location.lng = latlng[1]
    save_status = @location.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/locations/#{@location.id}/edit", "/update_location"
        redirect_to("/locations/#{@location.id}", :notice => "Location updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Location updated successfully.")
      end
    else
      render("locations/edit.html.erb")
    end
  end

  def destroy
    @location = Location.find(params[:id])

    @location.destroy

    if URI(request.referer).path == "/locations/#{@location.id}"
      redirect_to("/", :notice => "Location deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Location deleted.")
    end
  end
end
