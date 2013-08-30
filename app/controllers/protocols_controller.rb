class ProtocolsController < ApplicationController
  def admin
  
    if current_user.has_role?("Admin") 
      if !params[:status]
          @protocols = ResponseSet.all
      else

        statuses = Status.where(:state => params[:status])
        @protocols = ResponseSet.where(:access_code => statuses.map { |s| s.survey_id } )
      end

      @surveys = {}
      @files = {}
      @protocols.each do |p| 
        @surveys[p.survey_id.to_s] = Survey.find(p.survey_id).access_code
        @files[p.id.to_s] = SurveyFile.where(:response_set_id => p.id)
      end
      @title_questions = Question.where("text LIKE '%Title%'").map{|q| q.id} + Question.where("text LIKE '%TITLE%'").map{|q| q.id}
      # @statuses = Status.where(:survey_id => @protocols.map { |e|  e.access_code}) 
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @protocols }

      

      end
    else
      redirect_to :back
    end
  end
  
  # GET /protocols
  # GET /protocols.json
  def index
    @survey_file = SurveyFile.new()

    
    if !params[:status]
        @protocols = ResponseSet.where(:user_id => current_user)
    else

      statuses = Status.where(:state => params[:status])
      @protocols = ResponseSet.where(:user_id => current_user,:access_code => statuses.map { |s| s.survey_id } )
    end

    @surveys = {}
    @files ={}
    @protocols.each do |p| 
      @surveys[p.survey_id.to_s] = Survey.find(p.survey_id).access_code
       @files[p.id.to_s] = SurveyFile.where(:response_set_id => p.id)
    end
    @title_questions = Question.where("text LIKE '%Title%'").map{|q| q.id} + Question.where("text LIKE '%TITLE%'").map{|q| q.id}
    # @statuses = Status.where(:survey_id => @protocols.map { |e|  e.access_code}) 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @protocols }

      

    end
  end

    #  @statuses = statuses.where(:state => params[:status]:access_code => statuses.map { |s| s.survey_id } )
     # @protocol = Protocol.find(params[:id])
     #     @protocols = ResponseSet.where(:status => 'submitted')
    #  @protocol = Protocol.find(params[:id])
       #   @protocols = ResponseSet.where(:user_id => current_user)



  # GET /protocols/1
  # GET /protocols/1.json
  def show
    @protocol = Protocol.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @protocol }
    end
  end

  # GET /protocols/new
  # GET /protocols/new.json
  def new
    @protocol = Protocol.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @protocol }
    end
  end

  # GET /protocols/1/edit
  def edit
    @protocol = Protocol.find(params[:id])
  end

  # POST /protocols
  # POST /protocols.json
  def create
    @protocol = Protocol.new(params[:protocol])

    respond_to do |format|
      if @protocol.save
        format.html { redirect_to @protocol, notice: 'Protocol was successfully created.' }
        format.json { render json: @protocol, status: :created, location: @protocol }
      else
        format.html { render action: "new" }
        format.json { render json: @protocol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /protocols/1
  # PUT /protocols/1.json
  def update
    @protocol = Protocol.find(params[:id])

    respond_to do |format|
      if @protocol.update_attributes(params[:protocol])
        format.html { redirect_to @protocol, notice: 'Protocol was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @protocol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /protocols/1
  # DELETE /protocols/1.json
  def destroy
#status_url(Status.find_by_survey_id(protocol.access_code)
    #@p = ResponseSet.where(:user_id => current_user)
    #@protocol = user_id.find_by_survey_id(protocol.access_code)
    #@p =  ResponseSet.where(:question_id => @title_questions).first.string_value
    p= ResponseSet.where(:access_code => params[:id])
    p.first.destroy
    

    respond_to do |format|
      format.html { redirect_to protocols_url }
      format.json { head :no_content }
    end
  end
  
  #nees survey_id and access_code
  def make_modification
    cur_resp = ResponseSet.where(:user_id => current_user, :access_code => params[:protocol_id]).first
    mod = ResponseSet.create(:user_id=>current_user.id,
                          :survey_id => params[:survey_id])
    mod.parent_id = params[:protocol_id]
    mod.save
    resp_set_id = cur_resp.id
    responses = Response.where(:response_set_id => resp_set_id)
    responses.each do |resp| 
      answer_attributes = Answer.find(resp.answer_id).attributes
      answer_attributes.delete("id")
      answer_attributes.delete("api_id")
      answer_attributes.delete("created_at")
      answer_attributes.delete("updated_at")
      new_answer = Answer.new(answer_attributes)
      new_answer.save
      resp_attributes = resp.attributes
      resp_attributes.delete("id")
      resp_attributes.delete("api_id")
      resp_attributes.delete("created_at")
      resp_attributes.delete("updated_at")
      resp_attributes[:answer_id] = new_answer.id
      resp_attributes[:response_set_id] = mod.id
      new_resp = Response.new(resp_attributes)
      new_resp.save
    end
    redirect_to :back
  end
end
