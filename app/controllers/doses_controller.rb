class DosesController < ApplicationController
  before_action :set_dose_instance, only: [:index, :show, :edit, :update]
  def index
    @cocktail = Cocktail.find(params[:cocktail_id])
    @doses = Dose.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  private
  def set_dose_instance
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient)
  end
end
