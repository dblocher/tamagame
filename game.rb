class Pet
  #what types of attributes does our pet have?
  #can our pet perform certain actions? (eg. age, make noise, jump, sleep, eat)
  #extra credit: how would you use inheritance to build out a game that lets users manage multiple tamagotchi's?
attr_accessor :name, :age, :hungry, :asleep

  def initialize(name, age)
  	@name = name
  	@age = age
  	@hunger = 0
  	@energy = 100
  end

  def status

  end

  def fetch
  	loop do
  		break if too_tired
  		puts "You throw the ball to #{name}."
  		puts "#{name} brings the ball back."
  		puts "Throw again? (Y/N)"
  		input = get_user_input
  		@energy -= 5
  		if input.upcase == "N"
  			puts "No more fetch!"
  			break
  		elsif input.upcase != "Y"
  			"Sorry, that was not a valid command."
  			break
  		end
  	end
  end

  def rest
  	if @energy < 50
  		puts "#{name} is going to take a long nap."
  		@energy += (100 - @energy)/2
  	elsif @energy < 75
  		puts "#{name} is going to take a short rest."
  		@energy += (100 - @energy)/2
  	else
  		puts "#{name} is not very tired right now."
  	end
  end


  def too_tired
  	if @energy < 20
  		puts "#{name} is too tired right now."
  		@energy -= 2
  		true
  	end
  end

  def dead
  	if @energy <= 0
  		puts "#{name} has died due to lack of sleep."
  		true
  	elsif @hunger >= 100
  		puts "#{name} has died of hunger."
  		true
  	end
  end

  def get_user_input
    print "> "
    gets.chomp
  end




end

class Game
  #initialize your game
  #we should be able to accept input from a user
  #should our game continue until the user quits?

def run!
	loop do
		puts "What would you like to name your pet?"
		name = get_user_input
		puts "How old is your pet (in years)?"
		age = get_user_input
		@my_pet = Pet.new(name, age.to_i)

		loop do 
			break if @my_pet.dead
			puts "What would you like to do with your pet? (Type 'help' for a list of commands)"
			user_input = get_user_input
			p command(user_input)
		end

		puts "Would you like to play again with a new pet? (Y/N)"
		response = get_user_input.upcase
		if response == "N"
			exit
		end

	end
	#puts my_pet.name
	#puts my_pet.age
end

def command(input)
	case input.downcase
	when "fetch"
		@my_pet.fetch
	when "rest"
		@my_pet.rest
	when "help"
		puts "1. fetch\n2. rest \n 3. exit"
	when "exit"
		exit
	else
		puts "Sorry, I do not recognize this command."
	end
end

def get_user_input
    print "> "
    gets.chomp
end

end

Game.new.run!