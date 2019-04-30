class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @contestants = ContestantTeam.where(game_id: @game.id).order("score DESC")
    @ranks = Array.new
    rank = 1
    for  x  in 0..(@contestants.size - 1)
      if @ranks.size > 0 && @contestants[x].score == @contestants[x - 1].score
        @ranks << @ranks[x - 1]
      else
        @ranks << rank
      end
      rank = rank + 1
      puts @ranks[x]
    end
  end

  # GET /games/new
  def new
    @game = Game.new
    2.times{
      @game.contestant_teams.build
    }
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    @game.sport_id = 1
    @game.created_by_id = session['id']
    @game.last_updated_by_id = session['id']
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game.event, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    @game.last_updated_by_id = session['id']
    @game.created_by_id = session['id']
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game.event, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.contestant_teams.destroy_all
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name, :game_type, :sport_id, :schedule, :status, :quarter, :event_id, contestant_teams_attributes: [:id, :team_id, :score])
    end
end
