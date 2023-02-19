class CharactersController < ApplicationController
  before_action :set_character,
                only: %i[show edit update destroy]

  def index
    @characters = Character.all.order(:name)
  end

  def show; end

  def new
    @form = CharacterForm.new(Character.new)
  end

  def create
    @form = CharacterForm.new(Character.new(level: 1))

    if @form.validate(character_params)
      @form.save
      redirect_to characters_path
    else
      render action: 'new'
    end
  end

  def edit
    @form = CharacterForm.new(@character)
  end

  def update
    @form = CharacterForm.new(@character)

    if @form.validate(character_params)
      @form.save
      redirect_to characters_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @character.delete

    redirect_to :back
  end

  private

  def set_character
    @character = Character.find params[:id]
  end

  def character_params
    params.require(:character)
          .permit :name, :life, :attack, :defense, :avatar
  end
end
