def prompt(message)
    Kernel.puts("=> #{message}")
end

def valid_number?(num1)
    num1.to_i() != 0
end

def operation_to_message(op)
    case op
     when '1'
     'Adding'
     when '2'
     'Subtracting'
     when '3'
     'Multiplying'
     when '4'
        'Dividing'
    end
end

prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
    name = Kernel.gets().chomp()
    
    if name.empty?()
        prompt("Make sure to use a valid name.")
    else
        break
    end
end

prompt("Hi #{name}!")

loop do #main loop
    num1 = ''
    loop do
        prompt("Please enter first number")
        num1 = Kernel.gets().chomp()
        
        if valid_number?(num1)
            break
        else
            prompt("Hmm... that doesn't look like a number")
        end
    end
    
    num2 = ''
    loop do
        prompt("Please enter second number")
        num2 = Kernel.gets().chomp() 
        
        if valid_number?(num2)
            break
        else
            prompt("Hmm... that doesn't look like a number")
        end
    end
    
    operation_prompt = <<-MSG
        What operation would you like to perform?
        1) add
        2) subtract
        3) multiply
        4) divide
    MSG
    
    prompt(operation_prompt)
    
    operation = ''
    loop do
      operation = Kernel.gets().chomp()
      
      if %w(1 2 3 4).include?(operation)
          break
      else
          prompt("Must choose 1, 2, 3, 4")
      end
    end
    
    prompt("#{operation_to_message(operation)} the two numbers...") 
    results = case operation
               when '1'
                 num1.to_i + num2.to_i
               when '2'
                 num1.to_i - num2.to_i
               when '3'
                 num1.to_i * num2.to_i
               when '4'
                 num1.to_f / num2.to_f
              end
    
      
    prompt("The result is #{results}")
    
    prompt("Do you want to perfom another calculation? (Y to calculate again)")
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator. Good bye!")