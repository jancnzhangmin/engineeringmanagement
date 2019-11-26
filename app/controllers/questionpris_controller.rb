class QuestionprisController < ApplicationController
  before_action :set_questionpri, only: [:show, :edit, :update, :destroy]

  # GET /mytests
  # GET /mytests.json
  def index
    @questionpris = Questionpri.all
  end

  # GET /mytests/1
  # GET /mytests/1.json
  def show
  end

  # GET /mytests/new
  def new
    @questionpri = Questionpri.new
  end

  # GET /mytests/1/edit
  def edit
  end

  # POST /mytests
  # POST /mytests.json
  def create
    @questionpri = Questionpri.new(questionpri_params)
    respond_to do |format|
      if @questionpri.save
        if questionpri_params[:isdefault] == '1'
          changedefault(@questionpri.id)
        end
        format.html { redirect_to questionpris_path, notice: 'Mytest was successfully created.' }
        format.json { render :show, status: :created, location: @questionpri }
      else
        format.html { render :new }
        format.json { render json: @questionpri.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mytests/1
  # PATCH/PUT /mytests/1.json
  def update
    respond_to do |format|
      if @questionpri.update(questionpri_params)
        if questionpri_params[:isdefault] == '1'
          changedefault(@questionpri.id)
        end
        format.html { redirect_to questionpris_path, notice: 'Mytest was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionpri }
      else
        format.html { render :edit }
        format.json { render json: @questionpri.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mytests/1
  # DELETE /mytests/1.json
  def destroy
    @questionpri.destroy
    respond_to do |format|
      format.html { redirect_to questionpris_path, notice: 'Mytest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_questionpri
    @questionpri = Questionpri.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def questionpri_params
    params.require(:questionpri).permit(:pri, :isdefault)
  end

  def changedefault(id)
    questionpris = Questionpri.all
    questionpris.each do |q|
      q.isdefault = 0
      q.save
    end
    questionpri = Questionpri.find(id)
    questionpri.isdefault = 1
    questionpri.save
  end
end
