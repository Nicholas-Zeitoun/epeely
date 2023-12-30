class MatchesController < ApplicationController
  before_action :set_match, only: %i[ show edit update destroy ]

  # GET /matches
  def index
    @matches = Match.all
  end

  # GET /matches/1
  def show
    @score1 = @match.scores.first
  end

  # GET /matches/new
  def new
    @match = Match.new
    @fencers = Fencer.all

  end

  # GET /matches/1/edit
  def edit
    @score1
    @score2
  end

  # POST /matches
  def create
    @match = Match.new(match_params)
    @match.save
    @fencer1 = Fencer.find(1)
    @fencer2 = Fencer.find(2)
    @score1 = Score.new(points: 0)
    @score2 = Score.new(points: 0)
    @score1.match = @match
    @score1.fencer = @fencer1
    @score2.match = @match
    @score2.fencer = @fencer2
    @score1.save
    @score2.save

    if @match.save
      redirect_to @match, notice: "Match was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /matches/1
  def update
    @score1 = @match.scores.first
    @score1.points = match_params["score_1"].to_i
    @score1.save
    @score2 = @match.scores.second
    @score2.points = match_params["score_2"].to_i
    @score2.save
    if match_params
      redirect_to @match, notice: "Match was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /matches/1
  def destroy
    @match.destroy!
    redirect_to matches_url, notice: "Match was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def match_params
      params.fetch(:match, :score_1, :score_2, {})
    end
end
