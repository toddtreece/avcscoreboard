class BotTypesController < ApplicationController
  # GET /bot_types
  # GET /bot_types.xml
  def index
    @bot_types = BotType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bot_types }
    end
  end

  # GET /bot_types/1
  # GET /bot_types/1.xml
  def show
    @bot_type = BotType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bot_type }
    end
  end

  # GET /bot_types/new
  # GET /bot_types/new.xml
  def new
    @bot_type = BotType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bot_type }
    end
  end

  # GET /bot_types/1/edit
  def edit
    @bot_type = BotType.find(params[:id])
  end

  # POST /bot_types
  # POST /bot_types.xml
  def create
    @bot_type = BotType.new(params[:bot_type])

    respond_to do |format|
      if @bot_type.save
        format.html { redirect_to(@bot_type, :notice => 'Bot type was successfully created.') }
        format.xml  { render :xml => @bot_type, :status => :created, :location => @bot_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bot_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bot_types/1
  # PUT /bot_types/1.xml
  def update
    @bot_type = BotType.find(params[:id])

    respond_to do |format|
      if @bot_type.update_attributes(params[:bot_type])
        format.html { redirect_to(@bot_type, :notice => 'Bot type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bot_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bot_types/1
  # DELETE /bot_types/1.xml
  def destroy
    @bot_type = BotType.find(params[:id])
    @bot_type.destroy

    respond_to do |format|
      format.html { redirect_to(bot_types_url) }
      format.xml  { head :ok }
    end
  end
end
