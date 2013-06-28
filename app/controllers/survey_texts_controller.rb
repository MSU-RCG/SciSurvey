class SurveyTextsController < ApplicationController
  # GET /survey_texts
  # GET /survey_texts.json
  def index
    @survey_texts = SurveyText.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @survey_texts }
    end
  end

  # GET /survey_texts/1
  # GET /survey_texts/1.json
  def show
    @survey_text = SurveyText.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @survey_text }
    end
  end

  # GET /survey_texts/new
  # GET /survey_texts/new.json
  def new
    @survey_text = SurveyText.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @survey_text }
    end
  end

  # GET /survey_texts/1/edit
  def edit
    @survey_text = SurveyText.find(params[:id])
  end

  # POST /survey_texts
  # POST /survey_texts.json
  def create
    @survey_text = SurveyText.new(params[:survey_text])

    respond_to do |format|
      if @survey_text.save
        format.html { redirect_to @survey_text, notice: 'Survey text was successfully created.' }
        format.json { render json: @survey_text, status: :created, location: @survey_text }
      else
        format.html { render action: "new" }
        format.json { render json: @survey_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /survey_texts/1
  # PUT /survey_texts/1.json
  def update
    @survey_text = SurveyText.find(params[:id])

    respond_to do |format|
      if @survey_text.update_attributes(params[:survey_text])
        format.html { redirect_to @survey_text, notice: 'Survey text was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @survey_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_texts/1
  # DELETE /survey_texts/1.json
  def destroy
    @survey_text = SurveyText.find(params[:id])
    @survey_text.destroy

    respond_to do |format|
      format.html { redirect_to survey_texts_url }
      format.json { head :no_content }
    end
  end
end
