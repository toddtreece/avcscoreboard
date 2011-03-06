class HeatsController < ApplicationController
  # GET /heats
  # GET /heats.xml
  def index
    @heats = Heat.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @heats }
    end
  end

  # GET /heats/1
  # GET /heats/1.xml
  def show
    @heat = Heat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @heat }
    end
  end

  # GET /heats/new
  # GET /heats/new.xml
  def new
    @heat = Heat.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @heat }
    end
  end

  # GET /heats/1/edit
  def edit
    @heat = Heat.find(params[:id])
  end

  # POST /heats
  # POST /heats.xml
  def create
    @heat = Heat.new(params[:heat])

    respond_to do |format|
      if @heat.save
        format.html { redirect_to(@heat, :notice => 'Heat was successfully created.') }
        format.xml  { render :xml => @heat, :status => :created, :location => @heat }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @heat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /heats/1
  # PUT /heats/1.xml
  def update
    @heat = Heat.find(params[:id])

    respond_to do |format|
      if @heat.update_attributes(params[:heat])
        format.html { redirect_to(@heat, :notice => 'Heat was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @heat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /heats/1
  # DELETE /heats/1.xml
  def destroy
    @heat = Heat.find(params[:id])
    @heat.destroy

    respond_to do |format|
      format.html { redirect_to(heats_url) }
      format.xml  { head :ok }
    end
  end
end
