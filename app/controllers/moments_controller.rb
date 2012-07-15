class MomentsController < ApplicationController
  # GET /moments
  # GET /moments.json
  def index
    @moments = moment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moments }
    end
  end

  # GET /moments/1
  # GET /moments/1.json
  def show
    @moment = moment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moment }
    end
  end

  # GET /moments/new
  # GET /moments/new.json
  def new
    @moment = moment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moment }
    end
  end

  # GET /moments/1/edit
  def edit
    @moment = moment.find(params[:id])
  end

  # POST /moments
  # POST /moments.json
  def create
    @moment = moment.new(params[:moment])

    @moment.tag_list = params[:tags] if params[:tags].present?
    respond_to do |format|
      if @moment.save
        format.html { redirect_to @moment, notice: 'moment was successfully created.' }
        format.json { render json: @moment, status: :created, location: @moment }
      else
        format.html { render action: "new" }
        format.json { render json: @moment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moments/1
  # PUT /moments/1.json
  def update
    @moment = moment.find(params[:id])
    @moment.save

    respond_to do |format|
      if @moment.update_attributes(params[:moment])
        @moment.tag_list = params[:tags] if params[:tags].present?
        @moment.save
        format.html { redirect_to @moment, notice: 'moment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moments/1
  # DELETE /moments/1.json
  def destroy
    @moment = moment.find(params[:id])
    @moment.destroy

    respond_to do |format|
      format.html { redirect_to moments_url }
      format.json { head :no_content }
    end
  end
end
