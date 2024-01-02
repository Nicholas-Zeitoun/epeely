class TournamentsController < ApplicationController
  before_action :set_tournament, only: %i[ show edit update destroy ]
  before_action :set_update, only: %i[ update ]

  # GET /tournaments
  def index
    @tournaments = Tournament.all
  end

  # GET /tournaments/1
  def show
  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
  end
  
  # GET /tournaments/1/edit
  def edit
    @fencers = Fencer.order(points: :desc)
    @first_fencer = @fencers.first
  end

  # POST /tournaments
  def create
    @tournament = Tournament.new(tournament_params)
    @fencers = Fencer.all
    @tournament.fencers = @fencers

    if @tournament.save
      redirect_to @tournament, notice: "Tournament was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tournaments/1
  def update
    participants = params[:tournament][:fencer_ids]
    @tournament.fencers = []
    # Only getting fencers that have been selected for participation
    participants.shift
    participants.each do | participant |
      new_participant = Fencer.find(participant.to_i)
      @tournament.fencers << new_participant
    end

    poule_breakdown = test(@tournament.fencers.count)
    poule_breakdown[:number_of_poules].times do | index |
      poule_no = index+1
      poule_fencers = []
      poule_breakdown["poule_#{poule_no.to_s}_fencers"].each do | fencer_index |
      puts "🤺🤺🤺 #{fencer_index}" 
        fencer =  @tournament.fencers.order(points: :desc)[fencer_index.to_i - 1]
        poule_fencers << fencer
      end
      poule = Poule.new(:tournament => @tournament)
      poule.save!
      five_fencers(poule, poule_fencers)
    end

    @tournament.save
    if update_params
      redirect_to @tournament, notice: "Tournament was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def test(number_of_fencers)
    #{ number_of_poules, poule_1_fencers, poule_2_fencers, poule_n_fencers... }
    poule_breakdown = {}
    case number_of_fencers
      when 5
        poule_breakdown = { number_of_poules: 1, "poule_1_fencers" => [1,2,3,4,5] }
      when 10
        poule_breakdown = { number_of_poules: 2, "poule_1_fencers" => [1,4,6,8,10], "poule_2_fencers" => [2,3,4,5,7,9] }
      else
        poule_breakdown = 0
    end
    return poule_breakdown
  end

  # Poule of 5
  def five_fencers(poule, fencers)
    # fencers = Fencer.all
    # Get the 5 fencers
    fencer1 = fencers.first 
    fencer2 = fencers.second 
    fencer3 = fencers.third
    fencer4 = fencers.fourth 
    fencer5 = fencers.fifth

    new_matches = []

    # Create 10 matches
    10.times do
      match = Match.new(:poule => poule)
      match.save!
      new_matches << match
    end

    # Match 1
    @scorem1a = Score.new(points: 0)
    @scorem1b = Score.new(points: 0)
    @scorem1a.match = new_matches[0]
    @scorem1a.fencer = fencer1
    @scorem1b.match = new_matches[0]
    @scorem1b.fencer = fencer2
    @scorem1a.save
    @scorem1b.save
    
    # Match 2
    @scorem2a = Score.new(points: 0)
    @scorem2b = Score.new(points: 0)
    @scorem2a.match = new_matches[1]
    @scorem2a.fencer = fencer3
    @scorem2b.match = new_matches[1]
    @scorem2b.fencer = fencer4
    @scorem2a.save
    @scorem2b.save

    # Match 3
    @scorem3a = Score.new(points: 0)
    @scorem3b = Score.new(points: 0)
    @scorem3a.match = new_matches[2]
    @scorem3a.fencer = fencer5
    @scorem3b.match = new_matches[2]
    @scorem3b.fencer = fencer1
    @scorem3a.save
    @scorem3b.save

    # Match 4
    @scorem3a = Score.new(points: 0)
    @scorem3b = Score.new(points: 0)
    @scorem3a.match = new_matches[3]
    @scorem3a.fencer = fencer2
    @scorem3b.match = new_matches[3]
    @scorem3b.fencer = fencer3
    @scorem3a.save
    @scorem3b.save

    # Match 5
    @scorem4a = Score.new(points: 0)
    @scorem4b = Score.new(points: 0)
    @scorem4a.match = new_matches[4]
    @scorem4a.fencer = fencer5
    @scorem4b.match = new_matches[4]
    @scorem4b.fencer = fencer4
    @scorem4a.save
    @scorem4b.save    

    # Match 6
    @scorem5a = Score.new(points: 0)
    @scorem5b = Score.new(points: 0)
    @scorem5a.match = new_matches[5]
    @scorem5a.fencer = fencer1
    @scorem5b.match = new_matches[5]
    @scorem5b.fencer = fencer3
    @scorem5a.save
    @scorem5b.save
    
    # Match 7
    @scorem6a = Score.new(points: 0)
    @scorem6b = Score.new(points: 0)
    @scorem6a.match = new_matches[6]
    @scorem6a.fencer = fencer2
    @scorem6b.match = new_matches[6]
    @scorem6b.fencer = fencer5
    @scorem6a.save
    @scorem6b.save

    # Match 8
    @scorem7a = Score.new(points: 0)
    @scorem7b = Score.new(points: 0)
    @scorem7a.match = new_matches[7]
    @scorem7a.fencer = fencer4
    @scorem7b.match = new_matches[7]
    @scorem7b.fencer = fencer1
    @scorem7a.save
    @scorem7b.save

    # Match 9
    @scorem8a = Score.new(points: 0)
    @scorem8b = Score.new(points: 0)
    @scorem8a.match = new_matches[8]
    @scorem8a.fencer = fencer3
    @scorem8b.match = new_matches[8]
    @scorem8b.fencer = fencer5
    @scorem8a.save
    @scorem8b.save

    # Match 10
    @scorem9a = Score.new(points: 0)
    @scorem9b = Score.new(points: 0)
    @scorem9a.match = new_matches[9]
    @scorem9a.fencer = fencer4
    @scorem9b.match = new_matches[9]
    @scorem9b.fencer = fencer2
    @scorem9a.save
    @scorem9b.save 
  end

  # DELETE /tournaments/1
  def destroy
    @tournament.destroy!
    redirect_to tournaments_url, notice: "Tournament was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    def set_update
      @tournament = Tournament.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tournament_params
      params.fetch(:tournament, {})
    end

    def update_params
      params.fetch(:tournament, :fencers, {})
    end

end
