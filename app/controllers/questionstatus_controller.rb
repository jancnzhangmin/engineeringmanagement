class QuestionstatusController < ApplicationController
  before_action :set_questionstatu, only: [:show, :edit, :update, :destroy]

  # GET /mytests
  # GET /mytests.json
  def index
    @questionstatus = Questionstatu.all.page(params[:page]).per(3)
  end

  # GET /mytests/1
  # GET /mytests/1.json
  def show
  end

  # GET /questionstatus/new
  def new
    @questionstatu = Questionstatu.new
  end

  # GET /mytests/1/edit
  def edit
  end

  # POST /mytests
  # POST /mytests.json
  def create
    @questionstatu = Questionstatu.new(questionstatu_params)
    respond_to do |format|
      if @questionstatu.save
        if questionstatu_params[:isdefault] == '1'
          changedefault(@questionstatu.id)
        end
        format.html { redirect_to questionstatus_index_path, notice: 'Questionstatu was successfully created.' }
        format.json { render :show, status: :created, location: @questionstatu }
      else
        debugger
        format.html { render :new }
        format.json { render json: @questionstatu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mytests/1
  # PATCH/PUT /mytests/1.json
  def update
    respond_to do |format|
      if @questionstatu.update(questionstatu_params)
        if questionstatu_params[:isdefault] == '1'
          changedefault(@questionstatu.id)
        end
        format.html { redirect_to questionstatus_index_path, notice: 'Questionstatu was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionstatu }
      else
        format.html { render :edit }
        format.json { render json: @questionstatu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mytests/1
  # DELETE /mytests/1.json
  def destroy
    @questionstatu.destroy
    respond_to do |format|
      format.html { redirect_to questionstatus_index_path, notice: 'Mytest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_questionstatu
    @questionstatu = Questionstatu.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def questionstatu_params
    params.require(:questionstatu).permit(:statu, :isdefault)
  end

  def changedefault(id)
    questionstatus = Questionstatu.all
    questionstatus.each do |q|
      q.isdefault = 0
      q.save
    end
    questionstatu = Questionstatu.find(id)
    questionstatu.isdefault = 1
    questionstatu.save
  end

end
