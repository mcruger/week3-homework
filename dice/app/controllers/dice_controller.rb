class DiceController < ApplicationController 

	def roll_dice

		#instead of generating random nums, i'll just populate an array with values
		#to sample from.
		die_values = ['1','2', '3', '4', '5', '6']

		#the game only takes 2 dice, setting that here for now. possible switch to param
		num_dice = 2

		@dice_values = die_values.sample(num_dice)

		render "dice"

	end

end