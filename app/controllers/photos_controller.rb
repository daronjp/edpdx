class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_filter :gate_keeper

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all.order(:product_id)
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    # @photo = Photo.new(photo_params)
    #
    # respond_to do |format|
    #   if @photo.save
    #     format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
    #     format.json { render :show, status: :created, location: @photo }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @photo.errors, status: :unprocessable_entity }
    #   end
    # end
### ^^ original


    @photo = Photo.new(photo_params)

    if @photo.save
      product = Photo.where(:product_id => photo_params[:product_id])
      if product.count == 1
        # product[0].is_main = 't'
        @photo.is_main = 't'
      else
        # product[0].is_main = 'f'
        @photo.is_main = 'f'
      end
      # product[0].save
      @photo.save
      redirect_to :back, notice: 'Photo was successfully created.'
     else
       render action: 'new'
    end


  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.avatar.destroy
    @photo.save
    @photo.destroy
    redirect_to photos_path
    # @photo.destroy
    # respond_to do |format|
    #   format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      # params.require(:photo).permit(:product_id, :image_url, :is_main)
      ## ^^ original
      params.require(:photo).permit(:avatar, :name, :product_id, :is_main, :orientation)
    end
end
