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
  end

  def update
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
    params.require(:interest).permit(:name, :image, :description, :board_id)
   end
end
