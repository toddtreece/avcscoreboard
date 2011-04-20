class LapsController < ApplicationController
  # GET /laps
  # GET /laps.xml
  def index
    @laps = Lap.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @laps }
    end
  end

  # GET /laps/1
  # GET /laps/1.xml
  def show
    @lap = Lap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lap }
    end
  end

  # GET /laps/new
  # GET /laps/new.xml
  def new
    @lap = Lap.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lap }
    end
  end

  # GET /laps/1/edit
  def edit
    @lap = Lap.find(params[:id])
  end

  # POST /laps
  # POST /laps.xml
  def create
    @lap = Lap.new(params[:lap])

    respond_to do |format|
      if @lap.save
        format.html { redirect_to(@lap, :notice => 'Lap was successfully created.') }
        format.xml  { render :xml => @lap, :status => :created, :location => @lap }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /laps/1
  # PUT /laps/1.xml
  def update
    @lap = Lap.find(params[:id])

    respond_to do |format|
      if @lap.update_attributes(params[:lap])
        format.html { redirect_to(@lap, :notice => 'Lap was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /laps/1
  # DELETE /laps/1.xml
  def destroy
    @lap = Lap.find(params[:id])
    @lap.destroy

    respond_to do |format|
      format.html { redirect_to(laps_url) }
      format.xml  { head :ok }
    end
  end
end
