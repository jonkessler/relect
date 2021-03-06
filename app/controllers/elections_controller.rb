class ElectionsController < ApplicationController
  load_and_authorize_resource

  before_filter :find_election, except: [:index, :new, :create]
  before_filter :check_locked, only: [:vote, :cast_votes]

  # GET /elections
  # GET /elections.json
  def index
    @elections = Election.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @elections }
    end
  end

  # GET /elections/1
  # GET /elections/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @election }
    end
  end

  # GET /elections/new
  # GET /elections/new.json
  def new
    @election = Election.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @election }
    end
  end

  # GET /elections/1/edit
  def edit
  end

  # POST /elections
  # POST /elections.json
  def create
    @election = Election.new(params[:election])

    respond_to do |format|
      if @election.save
        format.html { redirect_to @election, notice: 'Election was successfully created.' }
        format.json { render json: @election, status: :created, location: @election }
      else
        format.html { render action: "new" }
        format.json { render json: @election.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /elections/1
  # PUT /elections/1.json
  def update
    respond_to do |format|
      if @election.update_attributes(params[:election])
        format.html { redirect_to @election, notice: 'Election was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: :edit }
        format.json { render json: @election.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elections/1
  # DELETE /elections/1.json
  def destroy
    @election.destroy

    respond_to do |format|
      format.html { redirect_to elections_url }
      format.json { head :no_content }
    end
  end

  def vote
    if current_user.has_voted_in_election?(@election)
      flash[:error] = "Sorry, you have already voted in this election"
      redirect_to root_path
    end
  end

  def cast_votes
    if current_user.has_voted_in_election?(@election)
      flash[:error] = "Sorry, you have already voted in this election"
      redirect_to root_path and return
    end

    respond_to do |format|
      if @election.update_attributes(params[:election])
        format.html { redirect_to elections_path, notice: "Your vote has been cast for election: #{@election.name}" }
        format.json { head :no_content }
      else
        format.html { render action: :vote }
        format.json { render json: @race.errors, status: :unprocessable_entity }
      end
    end
  end

  def results
    @election = Election.find(params[:id])
    @results = @election.results
  end

  private

  def find_election
    @election = Election.find(params[:id])
  end

  def check_locked
    if @election.locked?
      flash[:error] = 'Sorry, voting is closed for this election.'
      redirect_to root_path
      false
    end
  end
end
