class ProductsController < ApplicationController
  before_filter :gate_keeper, :meao
  skip_before_filter :gate_keeper, only: [:index, :show]
  before_action only: [:show, :edit, :update, :destroy]

  def meao
    @cats = CATS
  end
  # GET /products
  # GET /products.json
  def index
    unless session[:visitor] == 'admin'
      Galileo.create(:controller => 'product',
                       :view => 'index',
                       :ip => request.remote_ip,
                       :referrer => request.referer)
    end


    if params[:type].nil?
      @products = LISTINGS
    else
      @products = Array.new
      LISTINGS['results'].each do |x|
        if x['taxonomy_path'].last == params[:type]
          @products.push(x)
        end
      end
    end

    @images = Hash.new
    @products.each do |x|
      @images[x['listing_id'].to_s] = HTTParty.get("https://openapi.etsy.com/v2/listings/"+x['listing_id'].to_s+"/images?api_key="+ENV['ETSY_API'])
    end
      # @products = Product.where("quantity > 0 and product_category_id = ?", params[:type])
    # elsif params[:type] == 'cutting_boards'
    #   @products = Product.where("quantity > 0 and product_category_id = 1")
    # elsif params[:type] == 'tasters'
    #   @products = Product.where("quantity > 0 and product_category_id = 2")
    # else
    #   @products = Product.where("quantity > 0")
    # end
    @expired = Cart.where("active = 't' and updated_at <= now() - interval '1 day'")
    #reset_session
  end

  # GET /products/1
  # GET /products/1.json
  def show
    unless session[:visitor] == 'admin'
      Galileo.create(:controller => 'product',
                       :view => 'show',
                       :ip => request.remote_ip,
                       :object => params[:id])
    end

    @product = HTTParty.get("https://openapi.etsy.com/v2/listings/"+params[:id].to_s+"?api_key="+ENV['ETSY_API'])
    @images = HTTParty.get("https://openapi.etsy.com/v2/listings/"+params[:id].to_s+"/images?api_key="+ENV['ETSY_API'])

    # @photo = Photo.where(:product_id => params[:id]).order(:sorting)
    # @product_note = ProductNote.where(:product_id => params[:id])

      #redirect_to action: show, id: params[:id], var: ''
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @photo = Photo.new
    @stock = Photo.where(:product_id => params[:id]).order(:sorting)
    @product_note = ProductNote.new
    @notes = ProductNote.where(:product_id => params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_product
    #   @product = Product.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def product_params
    #   params.require(:product).permit(:name, :price, :height, :width, :quantity, :description, :product_category_id, :length)
    # end
end
