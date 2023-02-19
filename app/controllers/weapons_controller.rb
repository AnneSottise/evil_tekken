class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all.order(:name)
  end
end
