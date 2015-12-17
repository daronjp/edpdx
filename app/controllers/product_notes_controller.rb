class ProductNotesController < ApplicationController
  before_filter :gate_keeper
  before_action :set_product_note, only: [:show, :edit, :update, :destroy]

  # GET /product_notes
  # GET /product_notes.json
  def index
    @product_notes = ProductNote.all
  end

  # GET /product_notes/1
  # GET /product_notes/1.json
  def show
  end

  # GET /product_notes/new
  def new
    @product_note = ProductNote.new
  end

  # GET /product_notes/1/edit
  def edit
  end

  # POST /product_notes
  # POST /product_notes.json
  def create
    @product_note = ProductNote.new(product_note_params)

    respond_to do |format|
      if @product_note.save
        format.html { redirect_to :back, notice: 'Product note was successfully created.' }
        format.json { render :show, status: :created, location: @product_note }
      else
        format.html { render :new }
        format.json { render json: @product_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_notes/1
  # PATCH/PUT /product_notes/1.json
  def update
    respond_to do |format|
      if @product_note.update(product_note_params)
        format.html { redirect_to @product_note, notice: 'Product note was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_note }
      else
        format.html { render :edit }
        format.json { render json: @product_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_notes/1
  # DELETE /product_notes/1.json
  def destroy
    @product_note.destroy
    respond_to do |format|
      format.html { redirect_to product_notes_url, notice: 'Product note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_note
      @product_note = ProductNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_note_params
      params.require(:product_note).permit(:product_id, :note)
    end
end
