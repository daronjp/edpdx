class Hq::ShipmentsController < ApplicationController

  before_filter :gate_keeper

  def index
    if params[:type] == "shipped"
      @shipment = Cart.where(:purchase => 't', :shipped => 't').order(:id)
    elsif params[:type] == "to_ship"
      @shipment = Cart.where(:purchase => 't', :shipped => 'f').order(:id)
    else
      @shipment = Cart.where(:purchase => 't').order(:id)
    end
  end

  def edit
    @cart = Cart.find(params[:id])
    @total = 0
    @cart.cart_items.each do |item|
      @total = @total + item.product.price
    end
  end

  def create
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

  def update
    if params[:tracking_id].blank? or params[:shipping_vendor].blank?
      flash[:notice] = "Tracking ID or Shipping Vendor is blank"
      redirect_to :back
    else
      cart = Cart.find(params[:id])
      cart.update(:tracking_id => params[:tracking_id],
                    :shipping_vendor => params[:shipping_vendor],
                    :shipped => 't')

      cust = Customer.find(cart.customer_id)
      @items = CartItem.where(:cart_id => cart.id)

      UserMailer.shipment_email(cust, cart).deliver_later
      redirect_to hq_shipments_path(type: "to_ship")
    end
    # respond_to do |format|
    #   if @cart.update(cart_params)
    #     format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @cart }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @cart.errors, status: :unprocessable_entity }
    #   end
    # end

  end


end
