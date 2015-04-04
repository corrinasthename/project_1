class PokemonController < ApplicationController
  def capture
    # @pokemon.trainer = current_trainer
    @captured = Pokemon.find(params[:id])
    @captured.trainer = current_trainer
    # @captured.trainer_id = current_trainer
  	if @captured.save
  	  redirect_to root_path
  	end
  end

  def damage
    # @damage = Pokemon.find(1)
    @damage = Pokemon.find(params[:id])
    @damage.health -= 10
    if @damage.save
      redirect_to trainer_path(params[:trainer_id])
    end
    if @damage.health <= 0
    	@damage.destroy
    end
  end

  def new
  	@pokemon = Pokemon.new
  	@pokemon.name = params[:name]
  	@pokemon.level = 1
  	@pokemon.health = 100
  	@pokemon.trainer = current_trainer
  	if @pokemon.save
  		redirect_to trainer_path(current_trainer.id)
  	else
  		@error = true
  		redirect_to new_path
  	end
  end
end