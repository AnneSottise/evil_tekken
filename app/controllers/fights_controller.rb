class FightsController < ApplicationController
  def index
    @fights = Fight.all.order(:name)
  end

  def show
    @fight = Fight.find params[:id]
    @winner = @fight.winner
    @loser = @fight.loser
    @rounds = @fight.rounds.order(:position)
  end

  # Maybe check if fighters are not both the same character
  def new
    fight = Fight.new
    2.times { |_t| fight.fighters.build }
    @form = FightForm.new(fight)
  end

  def create
    @form = FightForm.new(Fight.new)

    if @form.validate(fight_params)
      @form.save
      ProcessFight.call(fight: @form.model)

      redirect_to @form.model
    else
      render action: 'new'
    end
  end

  private

  def fight_params
    params.require(:fight)
          .permit fighters_attributes: %i[weapon_id character_id]
  end
end
