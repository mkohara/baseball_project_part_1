class PlayersController < ApplicationController
  def index
    @q = Player.ransack(params[:q])
    @players = @q.result(:distinct => true).includes(:notes, :assigned_to_a_scout, :is_favorited_by_scout, :team).page(params[:page]).per(10)

    render("players/index.html.erb")
  end

  def show
    @favorite = Favorite.new
    @assigned_player = AssignedPlayer.new
    @note = Note.new
    @player = Player.find(params[:id])

    render("players/show.html.erb")
  end

  def new
    @player = Player.new

    render("players/new.html.erb")
  end

  def create
    @player = Player.new

    @player.scout_id = params[:scout_id]
    @player.team_id = params[:team_id]
    @player.name = params[:name]
    @player.dob = params[:dob]
    @player.position = params[:position]

    save_status = @player.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/players/new", "/create_player"
        redirect_to("/players")
      else
        redirect_back(:fallback_location => "/", :notice => "Player created successfully.")
      end
    else
      render("players/new.html.erb")
    end
  end

  def edit
    @player = Player.find(params[:id])

    render("players/edit.html.erb")
  end

  def update
    @player = Player.find(params[:id])

    @player.scout_id = params[:scout_id]
    @player.team_id = params[:team_id]
    @player.name = params[:name]
    @player.dob = params[:dob]
    @player.position = params[:position]

    save_status = @player.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/players/#{@player.id}/edit", "/update_player"
        redirect_to("/players/#{@player.id}", :notice => "Player updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Player updated successfully.")
      end
    else
      render("players/edit.html.erb")
    end
  end

  def destroy
    @player = Player.find(params[:id])

    @player.destroy

    if URI(request.referer).path == "/players/#{@player.id}"
      redirect_to("/", :notice => "Player deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Player deleted.")
    end
  end
end
