class EventsController < ApplicationController
  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(:distinct => true).includes(:home_team, :away_team, :location).page(params[:page]).per(10)

    render("events/index.html.erb")
  end

  def show
    @event = Event.find(params[:id])

    render("events/show.html.erb")
  end

  def new
    @event = Event.new

    render("events/new.html.erb")
  end

  def create
    @event = Event.new

    @event.home_team_id = params[:home_team_id]
    @event.away_team_id = params[:away_team_id]
    @event.location_id = params[:location_id]
    @event.held_at = params[:held_at]

    save_status = @event.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/events/new", "/create_event"
        redirect_to("/events")
      else
        redirect_back(:fallback_location => "/", :notice => "Event created successfully.")
      end
    else
      render("events/new.html.erb")
    end
  end

  def edit
    @event = Event.find(params[:id])

    render("events/edit.html.erb")
  end

  def update
    @event = Event.find(params[:id])

    @event.home_team_id = params[:home_team_id]
    @event.away_team_id = params[:away_team_id]
    @event.location_id = params[:location_id]
    @event.held_at = params[:held_at]

    save_status = @event.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/events/#{@event.id}/edit", "/update_event"
        redirect_to("/events/#{@event.id}", :notice => "Event updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Event updated successfully.")
      end
    else
      render("events/edit.html.erb")
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    if URI(request.referer).path == "/events/#{@event.id}"
      redirect_to("/", :notice => "Event deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Event deleted.")
    end
  end
end
