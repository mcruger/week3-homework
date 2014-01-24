Dice::Application.routes.draw do
 
 
 
 get("/dice", { :controller => "dice", :action => "roll_dice" })
 get("/welcome", { :controller => "welcome", :action => "show_welcome" })


end
