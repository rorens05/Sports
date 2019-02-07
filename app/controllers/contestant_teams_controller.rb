class ContestantTeamsController < ApplicationController
  before_action :set_contestant_team, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /contestant_teams
  # GET /contestant_teams.json
  def index
    @contestant_teams = ContestantTeam.all
  end

  # GET /contestant_teams/1
  # GET /contestant_teams/1.json
  def show
  end

  # GET /contestant_teams/new
  def new
    @contestant_team = ContestantTeam.new
  end

  # GET /contestant_teams/1/edit
  def edit
  end

  # POST /contestant_teams
  # POST /contestant_teams.json
  def create
    @contestant_team = ContestantTeam.new(contestant_team_params)

    respond_to do |format|
      if @contestant_team.save
        format.html { redirect_to @contestant_team, notice: 'Contestant team was successfully created.' }
        format.json { render :show, status: :created, location: @contestant_team }
      else
        format.html { render :new }
        format.json { render json: @contestant_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contestant_teams/1
  # PATCH/PUT /contestant_teams/1.json
  def update
    respond_to do |format|
      if @contestant_team.update(contestant_team_params)
        format.html { redirect_to @contestant_team, notice: 'Contestant team was successfully updated.' }
        format.json { render :show, status: :ok, location: @contestant_team }
      else
        format.html { render :edit }
        format.json { render json: @contestant_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contestant_teams/1
  # DELETE /contestant_teams/1.json
  def destroy
    @contestant_team.destroy
    respond_to do |format|
      format.html { redirect_to contestant_teams_url, notice: 'Contestant team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contestant_team
      @contestant_team = ContestantTeam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contestant_team_params
      params.require(:contestant_team).permit(:team_id, :score, :game_id)
    end
end
