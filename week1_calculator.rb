puts "It's a tiny calulator, what would you like to do?"

loop do
  puts "===== please input your first number ====="
  num1 = gets.chomp

#### What if input isn't a number?

#  loop do
#    puts "You should input a number"
#    num1 = gets.chomp
#    break if num1.class == Float || num1.class == Integer
#  end

#### Code above does not work.

  puts "===== what would you like to do? (choose from +, -, *, /) ====="
  operator = gets.chomp
  loop do
    puts "You should choose from +, -, *, /"
    operator = gets.chomp
    break if operator == "+" || operator == "-" || operator == "*" || operator == "/"
  end

#### what if input isn't one of the four action?
#### => Solved!

  puts "===== What's your second number? ====="
  num2 = gets.chomp

#  loop do
#    puts "You should input a number"
#    num1 = gets.chomp
#    break if num1.class == Float || num1.class == Integer
#  end

case operator
when "+"
  result = num1.to_f + num2.to_f
when "-"
  result = num1.to_f - num2.to_f
when "*"
  result = num1.to_f * num2.to_f
when "/"
  result = num1.to_f / num2.to_f

#### What if an user input isn't one of the above?
#### => I tried to rewrite with if statement, and use "else" to represent
#### when input isn't one of the four operators, but soon realized that
#### it should be at the input stage, not here.

end

#### when num2.to_f, 9 / 0 = Infinity
#### when num2.to_i, 9 / 0 => ZeroDivisionError
#### How to fix it?
#### => It's not a problem, it's how Ruby is designed.
#### Ruby tracks the IEEE 754 Floating Point Standard.
#### Also read ZeroDivisionError in RubyDoc.

  puts "#{num1} #{operator} #{num2} = #{result}"
  puts "Would you like to do some more math? (y/n)"
  calculate_again = gets.chomp
  break if calculate_again != "y"
end

#### Say, result is 23.0, how to make it an integer 23? 


#### Is there any possible that we can input something like "5*13" and the application
#### can tell what num1, action, and num2 is?
#### 1. split (get num1, action, and num2)
#### 2. if input.include?("+") then num1 + num2
#### Possible? Go try in intuitive_calculator.rb.
