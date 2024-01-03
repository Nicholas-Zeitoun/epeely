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

    poule_breakdown = poule_info(@tournament.fencers.count)
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
      # five_fencers(poule, poule_fencers)
      match_creation(poule, poule_fencers)
    end

    @tournament.save
    if update_params
      redirect_to @tournament, notice: "Tournament was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def poule_info(number_of_fencers)
    #{ number_of_poules, poule_1_fencers, poule_2_fencers, poule_n_fencers... }
    poule_breakdown = {}
    case number_of_fencers
      when 5
        poule_breakdown = { number_of_poules: 1, "poule_1_fencers" => [1,2,3,4,5] }
      when 6
        poule_breakdown = { number_of_poules: 1, "poule_1_fencers" => [1,2,3,4,5,6] }
      when 7
        poule_breakdown = { number_of_poules: 1, "poule_1_fencers" => [1,2,3,4,5,6,7] }
      when 8
        poule_breakdown = { number_of_poules: 1, "poule_1_fencers" => [1,2,3,4,5,6,7,8] }
      when 9
        poule_breakdown = { number_of_poules: 2, "poule_1_fencers" => [1,3,5,7,9], "poule_2_fencers" => [2,4,6,8] }
      when 10
        poule_breakdown = { number_of_poules: 2, "poule_1_fencers" => [1,4,5,8,9], "poule_2_fencers" => [2,3,6,7,10] }
      when 11
        poule_breakdown = { number_of_poules: 2, "poule_1_fencers" => [1,4,5,8,9], "poule_2_fencers" => [2,3,6,7,10,11] }
      when 12
        poule_breakdown = { number_of_poules: 2, "poule_1_fencers" => [1,4,5,8,9,12], "poule_2_fencers" => [2,3,6,7,10,11] }
      when 13
        poule_breakdown = { number_of_poules: 2, "poule_1_fencers" => [1,4,5,8,9,12,13], "poule_2_fencers" => [2,3,6,7,10,11] }
      when 14
        poule_breakdown = { number_of_poules: 2, "poule_1_fencers" => [1,4,5,8,9,12,13], "poule_2_fencers" => [2,3,6,7,10,11,14] }
      when 15
        poule_breakdown = { number_of_poules: 3, "poule_1_fencers" => [1,6,7,12,13], "poule_2_fencers" => [2,5,8,11,14], "poule_3_fencers" => [3,4,9,10,15] }
      when 16
        poule_breakdown = { number_of_poules: 3, "poule_1_fencers" => [1,6,7,12,13], "poule_2_fencers" => [2,5,8,11,14], "poule_3_fencers" => [3,4,9,10,15,16] }
      when 17
        poule_breakdown = { number_of_poules: 3, "poule_1_fencers" => [1,6,7,12,13], "poule_2_fencers" => [2,5,8,11,14,17], "poule_3_fencers" => [3,4,9,10,15,16] }
      when 18
        poule_breakdown = { number_of_poules: 3, "poule_1_fencers" => [1,6,7,12,13,18], "poule_2_fencers" => [2,5,8,11,14,17], "poule_3_fencers" => [3,4,9,10,15,16] }
      when 19
        poule_breakdown = { number_of_poules: 3, "poule_1_fencers" => [1,6,7,12,13,18,19], "poule_2_fencers" => [2,5,8,11,14,17], "poule_3_fencers" => [3,4,9,10,15,16] }
      when 20
        poule_breakdown = { number_of_poules: 3, "poule_1_fencers" => [1,6,7,12,13,18,19], "poule_2_fencers" => [2,5,8,11,14,17,20], "poule_3_fencers" => [3,4,9,10,15,16] }
      when 21
        poule_breakdown = { number_of_poules: 3, "poule_1_fencers" => [1,6,7,12,13,18,19], "poule_2_fencers" => [2,5,8,11,14,17,20], "poule_3_fencers" => [3,4,9,10,15,16,21] }
      when 22
        poule_breakdown = { number_of_poules: 4, "poule_1_fencers" => [1,8,9,16,17], "poule_2_fencers" => [2,7,10,15,18], "poule_3_fencers" => [3,6,11,14,19,22], "poule_4_fencers" => [4,5,12,13,20,21] }
      when 23
        poule_breakdown = { number_of_poules: 4, "poule_1_fencers" => [1,8,9,16,17], "poule_2_fencers" => [2,7,10,15,18,23], "poule_3_fencers" => [3,6,11,14,19,22], "poule_4_fencers" => [4,5,12,13,20,21] }
      when 24
        poule_breakdown = { number_of_poules: 4, "poule_1_fencers" => [1,8,9,16,17,24], "poule_2_fencers" => [2,7,10,15,18,23], "poule_3_fencers" => [3,6,11,14,19,22], "poule_4_fencers" => [4,5,12,13,20,21] }
      when 25
        poule_breakdown = { number_of_poules: 4, "poule_1_fencers" => [1,8,9,16,17,24,25], "poule_2_fencers" => [2,7,10,15,18,23], "poule_3_fencers" => [3,6,11,14,19,22], "poule_4_fencers" => [4,5,12,13,20,21] }
      when 26
        poule_breakdown = { number_of_poules: 4, "poule_1_fencers" => [1,8,9,16,17,24,25], "poule_2_fencers" => [2,7,10,15,18,23,26], "poule_3_fencers" => [3,6,11,14,19,22], "poule_4_fencers" => [4,5,12,13,20,21] }
      when 27
        poule_breakdown = { number_of_poules: 4, "poule_1_fencers" => [1,8,9,16,17,24,25], "poule_2_fencers" => [2,7,10,15,18,23,26], "poule_3_fencers" => [3,6,11,14,19,22,27], "poule_4_fencers" => [4,5,12,13,20,21] }
      when 28
        poule_breakdown = { number_of_poules: 4, "poule_1_fencers" => [1,8,9,16,17,24,25], "poule_2_fencers" => [2,7,10,15,18,23,26], "poule_3_fencers" => [3,6,11,14,19,22,27], "poule_4_fencers" => [4,5,12,13,20,21,28] }
      when 29
        poule_breakdown = { number_of_poules: 5, "poule_1_fencers" => [1,10,11,20,21], "poule_2_fencers" => [2,9,12,19,22,29], "poule_3_fencers" => [3,8,13,18,23,28], "poule_4_fencers" => [4,7,14,17,24,27], "poule_5_fencers" => [5,6,15,16,25,26] }
      when 30
        poule_breakdown = { number_of_poules: 5, "poule_1_fencers" => [1,10,11,20,21,30], "poule_2_fencers" => [2,9,12,19,22,29], "poule_3_fencers" => [3,8,13,18,23,28], "poule_4_fencers" => [4,7,14,17,24,27], "poule_5_fencers" => [5,6,15,16,25,26] }
      when 31
        poule_breakdown = { number_of_poules: 5, "poule_1_fencers" => [1,10,11,20,21,30,31], "poule_2_fencers" => [2,9,12,19,22,29], "poule_3_fencers" => [3,8,13,18,23,28], "poule_4_fencers" => [4,7,14,17,24,27], "poule_5_fencers" => [5,6,15,16,25,26] }
      when 32
        poule_breakdown = { number_of_poules: 5, "poule_1_fencers" => [1,10,11,20,21,30,31], "poule_2_fencers" => [2,9,12,19,22,29,32], "poule_3_fencers" => [3,8,13,18,23,28], "poule_4_fencers" => [4,7,14,17,24,27], "poule_5_fencers" => [5,6,15,16,25,26] }
      else
        poule_breakdown = 0
    end
    return poule_breakdown
  end

  def match_info(number_of_fencers)
    match_breakdown = []
    case number_of_fencers
      when 4
        match_breakdown = [ 6, [0,1], [2,3], [1,2],
                               [0,2], [3,0], [3,1],]
      when 5
        match_breakdown = [ 10, [0,1], [2,3], [4,0], [1,2], [4,3],
                                [0,2], [1,4], [3,0], [2,4], [3,1],]
      when 6
        match_breakdown = [ 15, [0,1], [3,2], [5,4], [2,0], [1,5],
                                [4,3], [0,5], [2,4], [3,1], [4,0],
                                [5,3], [1,2], [0,3], [4,1], [2,5]]
      when 7
        match_breakdown = [ 21, [0,3], [1,4], [2,5], [6,0], [4,3],
                                [1,2], [5,6], [4,0], [3,2], [5,1],
                                [4,6], [2,0], [3,5], [6,1], [2,4],
                                [0,5], [1,3], [6,2], [5,4], [0,1],
                                [3,6]]
      when 8
        match_breakdown = [ 28, [1,2], [0,4], [6,3], [5,7], [0,1],
                                [2,3], [4,5], [7,6], [3,0], [4,1],
                                [7,2], [5,6], [3,1], [7,0], [6,5],
                                [2,5], [1,7], [4,3], [5,0], [2,6],
                                [3,7], [1,5], [2,4], [0,6], [3,5],
                                [7,4], [6,1], [0,2]]
      else
        match_breakdown = 0
    end
    return match_breakdown
  end

  # Match creation functionality
  def match_creation(poule, fencers)
    match_info = match_info(fencers.count)
    # Create matches as required by the poule info
    match_info[0].times do | index |
      match = Match.new(:poule => poule)
      match.save!
      # Create new scores
      @score1 = Score.new(points: 0)
      @score2 = Score.new(points: 0)
      @score1.match = match
      @score1.fencer = fencers[match_info[index+1][0]]
      @score1.save
      @score2.match = match
      @score2.fencer = fencers[match_info[index+1][1]]
      @score2.save
    end
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
