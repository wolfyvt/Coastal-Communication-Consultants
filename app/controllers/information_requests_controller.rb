class InformationRequestsController < ApplicationController
  skip_before_filter :authorize, only: :create


  # GET /information_requests
  # GET /information_requests.json
  def index
    @information_requests = InformationRequest.where("archived = ?", false)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @information_requests }
    end
  end

  def archived
    @information_requests = InformationRequest.where("archived = ?", true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test }
    end
  end

  # GET /information_requests/1
  # GET /information_requests/1.json
  def show
    @information_request = InformationRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @information_request }
    end
  end

  # GET /information_requests/new
  # GET /information_requests/new.json
  def new
    @information_request = InformationRequest.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @information_request }
    end
  end

  # GET /information_requests/1/edit
  def edit
    @information_request = InformationRequest.find(params[:id])
  end

  # POST /information_requests
  # POST /information_requests.json
  def create
    @information_request = InformationRequest.new(params[:information_request])
    @information_request.archived = false

    respond_to do |format|
      if @information_request.save
        InfoRequestConfirmation.requested(@information_request).deliver  # send email
        format.html { redirect_to root_path, notice: 'Thank You!  Your request for information has been successfully processed.' }
        #format.json { render json: @information_request, status: :created, location: @information_request }
      else
        format.html { render action: "new" }
        format.json { render json: @information_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /information_requests/1
  # PUT /information_requests/1.json
  def update
    @information_request = InformationRequest.find(params[:id])

    respond_to do |format|
      if @information_request.update_attributes(params[:information_request])
        format.html { redirect_to @information_request, notice: 'Information request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @information_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /information_requests/1
  # DELETE /information_requests/1.json
  def destroy
    @information_request = InformationRequest.find(params[:id])
    @information_request.destroy

    respond_to do |format|
      format.html { redirect_to information_requests_url }
      format.json { head :no_content }
    end
  end

  # ARCHIVE /information_requests/1
  # ARCHIVE /information_requests/1.json
  def archive
    puts "================================Begin Archive==============================="

    @information_request = InformationRequest.find(params[:id])
    @information_request.archived = true


    respond_to do |format|

      if @information_request.save
        format.html { redirect_to information_requests_url, notice: "Information request was successfully archived." }
        format.json { head :no_content }
      else
        format.html { redirect_to information_requests_url, notice: "THERE WAS AN ERROR ARCHIVING THE INFORMATION REQUESTS.  CONTACT ADMINISTRATORS!!" }
        format.json { head :no_content }
      end
    end
  end
   
end
#