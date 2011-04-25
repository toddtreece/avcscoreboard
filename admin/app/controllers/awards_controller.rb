class AwardsController < ApplicationController
  # GET /awards
  # GET /awards.xml
  def index
    @awards = Award.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @awards }
    end
  end

  # GET /awards/1
  # GET /awards/1.xml
  def show
    @award = Award.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @award }
    end
  end

  # GET /awards/new
  # GET /awards/new.xml
  def new
    @award = Award.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @award }
    end
  end

  # GET /awards/1/edit
  def edit
    @award = Award.find(params[:id])
  end

  # POST /awards
  # POST /awards.xml
  def create
    @award = Award.new(params[:award])

    respond_to do |format|
      if @award.save
        format.html { redirect_to(@award, :notice => 'Award was successfully created.') }
        format.xml  { render :xml => @award, :status => :created, :location => @award }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @award.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /awards/1
  # PUT /awards/1.xml
  def update
    @award = Award.find(params[:id])

    respond_to do |format|
      if @award.update_attributes(params[:award])
        format.html { redirect_to(@award, :notice => 'Award was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @award.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /awards/1
  # DELETE /awards/1.xml
  def destroy
    @award = Award.find(params[:id])
    @award.destroy

    respond_to do |format|
      format.html { redirect_to(awards_url) }
      format.xml  { head :ok }
    end
  end
end
