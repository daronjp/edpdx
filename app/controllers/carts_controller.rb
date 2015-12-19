class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    #@carts = Cart.all
    @carts = Cart.find(session[:cart])
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    if Cart.where(:id => params[:id]).count > 0
      if params[:id].to_i == session[:cart].to_i
        @items = CartItem.where(:cart_id => session[:cart]).order(:id)
        @cart = Cart.find(session[:cart])
      else
        if Customer.find(Cart.find(params[:id]).customer_id).email == params[:email]
          @items = CartItem.where(:cart_id => params[:id])
          @cart = Cart.find(params[:id])
        else
          flash[:notice] = "Invalid URL Please use the link in your email."
        end
      end
    else
      flash[:notice] = "Cart does not exist!"
    end

    unless session[:visitor] == 'admin'
      Galileo.create(:controller => 'cart',
                       :view => 'show',
                       :ip => request.remote_ip,
                       :object => session[:cart])
    end
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
    # @cart_items.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      if Cart.where(:id => params[:id]).count > 0
        @cart = Cart.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:customer_id, :active, :purchase, :tracking_id)
    end
end
