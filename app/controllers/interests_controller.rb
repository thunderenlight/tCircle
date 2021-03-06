class InterestsController < ApplicationController
  before_action :set_interest, only: [:show, :like, :repost, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @interest = current_user.interests.build
  end

  def edit
  end

  def show
  end

  def index
    @interests = Interest.all
  end

  def destroy
     @interest.destroy
     respond_to do |format|
      format.html { redirect_to user_path(current_user.username), notice: 'interest was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def update
     respond_to do |format|
      if @interest.update(interest_params)
        format.html { redirect_to user_path(current_user.username), notice: 'interest was successfully updated.' }
        format.json { render :show, status: :ok, location: @interest }
      else
        format.html { render :edit }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @interest = current_user.interests.build(interest_params)
    respond_to do |format|
      if @interest.save
        format.html { redirect_to interests_path, notice: 'Interest was successfully created!' }
        format.json { render :show, status: :created, location: @interest }
      else
        format.html { render :new }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  private
   def set_interest
    @interest = Interest.find(params[:id])
   end

   def interest_params
    params.require(:interest).permit(:name, :image, :description, :board_id, :url)
   end
   
   def correct_user
      @interest = current_user.interests.find_by(id: params[:id])
      redirect_to interests_path, notice: "Not authorized to edit this interest" if @interest.nil?
    end
end
