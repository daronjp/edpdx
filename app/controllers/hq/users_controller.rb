class Hq::UsersController < ApplicationController
  before_action :set_hq_user, only: [:show, :edit, :update, :destroy]
  before_filter :gate_keeper
  skip_before_filter :gate_keeper, only: [:index]

  # GET /hq/users
  # GET /hq/users.json
  def index
    @hq_users = Hq::User.all
  end

  # GET /hq/users/1
  # GET /hq/users/1.json
  def show
  end

  # GET /hq/users/new
  def new
    @hq_user = Hq::User.new
  end

  # GET /hq/users/1/edit
  def edit
  end

  # POST /hq/users
  # POST /hq/users.json
  def create
    @hq_user = Hq::User.new(hq_user_params)

    respond_to do |format|
      if @hq_user.save
        format.html { redirect_to @hq_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @hq_user }
      else
        format.html { render :new }
        format.json { render json: @hq_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hq/users/1
  # PATCH/PUT /hq/users/1.json
  def update
    respond_to do |format|
      if @hq_user.update(hq_user_params)
        format.html { redirect_to @hq_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @hq_user }
      else
        format.html { render :edit }
        format.json { render json: @hq_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hq/users/1
  # DELETE /hq/users/1.json
  def destroy
    @hq_user.destroy
    respond_to do |format|
      format.html { redirect_to hq_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hq_user
      @hq_user = Hq::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hq_user_params
      params.require(:hq_user).permit(:username, :password, :password_hash, :password_salt, :is_admin)
    end
end
