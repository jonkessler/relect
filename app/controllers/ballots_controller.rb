class BallotsController < ApplicationController
  # GET /elections/:election_id/ballots/1
  # GET /elections/:election_id/ballots/1.json
  def show
    @election = Election.find(params[:election_id])
    @ballot = @election.ballots.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ballot }
    end
  end

  # GET /elections/:election_id/ballots/new
  # GET /elections/:election_id/ballots/new.json
  def new
    @election = Election.find(params[:election_id])
    @ballot = @election.ballots.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ballot }
    end
  end

  # GET /elections/:election_id/ballots/1/edit
  def edit
    @election = Election.find(params[:election_id])
    @ballot = @election.ballots.find(params[:id])
  end

  # POST /elections/:election_id/ballots
  # POST /elections/:election_id/ballots.json
  def create
    @election = Election.find(params[:election_id])
    @ballot = @election.ballots.build(params[:ballot])

    respond_to do |format|
      if @ballot.save
        format.html { redirect_to [@election, @ballot], notice: 'Ballot was successfully created.' }
        format.json { render json: @ballot, status: :created, location: [@election, @ballot] }
      else
        format.html { render action: "new" }
        format.json { render json: @ballot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /elections/:election_id/ballots/1
  # PUT /elections/:election_id/ballots/1.json
  def update
    @election = Election.find(params[:election_id])
    @ballot = @election.ballots.find(params[:id])

    respond_to do |format|
      if @ballot.update_attributes(params[:ballot])
        format.html { redirect_to [@election, @ballot], notice: 'Ballot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ballot.errors, status: :unprocessable_entity }
      end
    end
  end
end
