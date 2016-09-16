def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  /^\d+$/.match(input)
end

def float?(input)
  /^\d*\.?\d*$/.match(input)
end

prompt('Welcome to the Mortgage Calculator')

prompt('What is your name?')

name = ''
loop do
  name = gets.chomp
    
  if name.empty?
    prompt("Please tell us your name")
  else
    break
  end
end

prompt(" Welcome #{name} ")


loop do #main loop

prompt('Enter the loan amount. Example: 500, 1000, 20000')
loan_amount = ''
loop do
    loan_amount = gets.chomp
    
    if integer?(loan_amount)
        break
    else
        prompt('Please enter a whole number for the loan amount')
    end
end


prompt('Enter the APR%. Example: 12.0 4.9 22')
apr = ''
loop do
    apr = gets.chomp
    
    if apr.empty?() || apr.to_f() < 0
      prompt("Must enter positive number.")
    else
      break
    end
end


prompt('Enter the number of years for your loan')
loan_duration_in_years = ''
loop do
    loan_duration_in_years = gets.chomp
     
    if integer?(loan_duration_in_years)
        break
    else
        prompt('Please enter a number for years')
    end
end

annual_int = apr.to_f / 100
monthly_int = annual_int / 12
loan_duration_in_mths = loan_duration_in_years.to_i * 12

monthly_payment = loan_amount.to_i * (monthly_int / (1 - (1 + monthly_int)**-loan_duration_in_mths.to_i))

prompt("#{name} your monthly payment is: $#{format('%02.2f', monthly_payment)}")

 
prompt("Do you want to perfom another calculation? (Y to calculate again)")
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
end

