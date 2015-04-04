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

  def create
  	@pokemon = Pokemon.create name:params[:name], level:1, health:100
  	@pokemon.trainer = current_trainer
  	if @pokemon.save
  		redirect_to trainer_path(current_trainer.id)
  	else
  		redirect_to new_path
  		@error = true
  	end
  end
end