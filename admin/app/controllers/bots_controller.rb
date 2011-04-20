class BotsController < ApplicationController
  # GET /bots
  # GET /bots.xml
  def index
    @bots = Bot.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bots }
    end
  end

  # GET /bots/1
  # GET /bots/1.xml
  def show
    @bot = Bot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bot }
    end
  end

  # GET /bots/new
  # GET /bots/new.xml
  def new
    @bot = Bot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bot }
    end
  end

  # GET /bots/1/edit
  def edit
    @bot = Bot.find(params[:id])
  end

  # POST /bots
  # POST /bots.xml
  def create
    @bot = Bot.new(params[:bot])

    respond_to do |format|
      if @bot.save
        format.html { redirect_to(@bot, :notice => 'Bot was successfully created.') }
        format.xml  { render :xml => @bot, :status => :created, :location => @bot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bots/1
  # PUT /bots/1.xml
  def update
    @bot = Bot.find(params[:id])

    respond_to do |format|
      if @bot.update_attributes(params[:bot])
        format.html { redirect_to(@bot, :notice => 'Bot was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bots/1
  # DELETE /bots/1.xml
  def destroy
    @bot = Bot.find(params[:id])
    @bot.destroy

    respond_to do |format|
      format.html { redirect_to(bots_url) }
      format.xml  { head :ok }
    end
  end
end
