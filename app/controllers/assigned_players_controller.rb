class AssignedPlayersController < ApplicationController
  before_action :current_user_must_be_assigned_player_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_assigned_player_scout
    assigned_player = AssignedPlayer.find(params[:id])

    unless current_user == assigned_player.scout
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = AssignedPlayer.ransack(params[:q])
    @assigned_players = @q.result(:distinct => true).includes(:scout, :player).page(params[:page]).per(10)

    render("assigned_players/index.html.erb")
  end

  def show
    @assigned_player = AssignedPlayer.find(params[:id])

    render("assigned_players/show.html.erb")
  end

  def new
    @assigned_player = AssignedPlayer.new

    render("assigned_players/new.html.erb")
  end

  def create
    @assigned_player = AssignedPlayer.new

    @assigned_player.scout_id = params[:scout_id]
    @assigned_player.player_id = params[:player_id]
    @assigned_player.name = params[:name]

    save_status = @assigned_player.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/assigned_players/new", "/create_assigned_player"
        redirect_to("/assigned_players")
      else
        redirect_back(:fallback_location => "/", :notice => "Assigned player created successfully.")
      end
    else
      render("assigned_players/new.html.erb")
    end
  end

  def edit
    @assigned_player = AssignedPlayer.find(params[:id])

    render("assigned_players/edit.html.erb")
  end

  def update
    @assigned_player = AssignedPlayer.find(params[:id])
    @assigned_player.player_id = params[:player_id]
    @assigned_player.name = params[:name]

    save_status = @assigned_player.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/assigned_players/#{@assigned_player.id}/edit", "/update_assigned_player"
        redirect_to("/assigned_players/#{@assigned_player.id}", :notice => "Assigned player updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Assigned player updated successfully.")
      end
    else
      render("assigned_players/edit.html.erb")
    end
  end

  def destroy
    @assigned_player = AssignedPlayer.find(params[:id])

    @assigned_player.destroy

    if URI(request.referer).path == "/assigned_players/#{@assigned_player.id}"
      redirect_to("/", :notice => "Assigned player deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Assigned player deleted.")
    end
  end
end
