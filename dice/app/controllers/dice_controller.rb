class DiceController < ApplicationController 

	def roll_dice

		#goal value needed to win
		@goal = params["goal"].to_i

		#instead of generating random nums, i'll just populate an array with values
		#to sample from.
		die_values = [1, 2, 3, 4, 5, 6]
		insta_win_values = [7, 11]  #win if rolled on first roll
		insta_loss_values = [2, 3, 12] #lose if rolled on first roll

		#get values for the dice
		@die_one_val = die_values.sample(1);
		@die_two_val = die_values.sample(1);
		@roll_total = @die_one_val[0] + @die_two_val[0]
		#@roll_total = 
	
		if @goal == 0
			#user started a new game and this is their first roll
			#check for instant win, loss, or set goal
			if insta_win_values.include?(@roll_total) 
				#user rolled an instant win
				render "win"
			elsif insta_loss_values.include?(@roll_total)
				#user rolled an instant loss
				render "loss"
			else
				#user set their goal and show now be rolling trying to hit the goal
				@goal = @roll_total #set goal to roll total. Note user can't roll a 7 
				render "set_goal"
			end
		else
			#user is playing the game, rolling to try to hit their goal
			if @roll_total == 7
				render "loss"
			elsif @roll_total == @goal
				render "win"
			else
				render "dice"
			end
		end

	end

end