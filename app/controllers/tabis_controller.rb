class TabisController < ApplicationController
  before_action :set_tabi, only: %i[ show edit update destroy ]
  before_action :set_q, only: [:top, :search]

  def top
    @random = Tabi.order("RANDOM()").limit(8)
    # 検索オブジェクト
    @search = Tabi.ransack(params[:q])
    # 検索結果
    @tabis = @search.result
    @tabis = @q.result(distinct: true) # distinct: trueは重複したデータを除外
  end

  def search
    @results = @q.result
    @q = Tabi.ransack(params[:q])
    @tabis = @q.result(distinct: true) 
  end

  def mytabi
    @tabis = current_user.tabis
  end

  # GET /tabis or /tabis.json
  def index
    @tabis = Tabi.all
  end

  # GET /tabis/1 or /tabis/1.json
  def show
    @tabi = Tabi.find(params[:id])
  end

  # GET /tabis/new
  def new
    @tabi = Tabi.new
  end

  # GET /tabis/1/edit
  def edit
  end

  # POST /tabis or /tabis.json
  def create
    @tabi = current_user.tabis.new(tabi_params)

    respond_to do |format|
      if @tabi.save
        format.html { redirect_to tabi_url(@tabi), notice: "Tabi was successfully created." }
        format.json { render :show, status: :created, location: @tabi }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tabi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tabis/1 or /tabis/1.json
  def update
    respond_to do |format|
      if @tabi.update(tabi_params)
        format.html { redirect_to tabi_url(@tabi), notice: "Tabi was successfully updated." }
        format.json { render :show, status: :ok, location: @tabi }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tabi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tabis/1 or /tabis/1.json
  def destroy
    @tabi.destroy

    respond_to do |format|
      format.html { redirect_to tabis_url, notice: "Tabi was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tabi
      @tabi = Tabi.find(params[:id])
    end

    def set_q
      @q = Tabi.ransack(params[:q])
    end

    # Only allow a list of trusted parameters through.
    def tabi_params
      params.require(:tabi).permit(:title, :content, :address, :latitude, :longitude, tabi_photos: []).merge(user_id: current_user.id)
    end
end
