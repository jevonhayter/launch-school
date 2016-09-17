VALID_CHOICES = %w(rock paper scissors lizard spock)
player_total = 0
computer_total = 0
ties = 0

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'lizard' && second == 'spock') ||
  (first ==  'lizard' && second == 'paper') ||
  (first == 'spock' && second == 'scissors') ||
  (first == 'spock' && second == 'rock') ||
  (first == 'scissors' && second == 'paper') ||
  (first == 'scissors' && second == 'lizard') ||
  (first == 'paper' && second == 'spock') ||
  (first == 'paper' && second == 'rock') ||
  (first == 'rock' && second == 'scissors') ||
  (first == 'rock' && second == 'lizard') 
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You won!')
  
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt('Its a tie')
  end
end

loop do # main loop
  
  choice = ''
loop do
  prompt("#{VALID_CHOICES.join(', ')}")
  choice = gets.chomp

  if VALID_CHOICES.include?(choice)
    break
  else
    prompt("That's not a valid choice")
  end
end
  computer_choice = VALID_CHOICES.sample

  prompt("You choice #{choice.upcase},
            Computer choose #{computer_choice.upcase}")

  display_results(choice, computer_choice)
  
  
  if win?(choice, computer_choice)
    player_total += 1
    prompt("Your score is => #{player_total} and Computer score is => #{computer_total}")
  elsif win?(computer_choice, choice)
    computer_total += 1
    prompt("Computer score is => #{computer_total} and Your score is => #{player_total}")
  else
   ties += 1
   prompt("There have been #{ties} ties")
  end
  
  if player_total > 4
    prompt("You won the Game!")
  elsif
    computer_total > 4
    prompt('The computer beat you')
  end
  

  prompt('Do you want to play again?')
  answer = gets.chomp
  
  break unless answer.downcase.start_with?('y')
end

  prompt('Thank you for playing, Good bye!')
  
  