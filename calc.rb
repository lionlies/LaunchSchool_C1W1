
OPERATORS = ["+", "-", "*", "/"]

puts "It's a tiny calulator."

loop do

  begin
    puts "===== please input your first number ====="
    num1 = gets.chomp
  end until num1.to_i.to_s == num1 || num1.to_f.to_s == num1

  begin
    puts "===== what would you like to do? (choose from +, -, *, /) ====="
    operator = gets.chomp
  end until OPERATORS.include?(operator)

  begin
    puts "===== What's your second number? ====="
    num2 = gets.chomp
  end until num2.to_i.to_s == num2 || num2.to_f.to_s == num2

  case operator
  when "+"
    result = num1.to_f + num2.to_f
  when "-"
    result = num1.to_f - num2.to_f
  when "*"
    result = num1.to_f * num2.to_f
  when "/"
    result = num1.to_f / num2.to_f
  end

  puts "#{num1} #{operator} #{num2} = #{result}"
  puts "Would you like to do some more math? (y/n)"
  break if gets.chomp != "y"
end

# What if an user input isn't one of the four operators?
# => I tried to rewrite with if statement, and use "else" to represent
# when input isn't one of the four operators, but soon realized that
# it should be at the input stage, not here.
# By the way, "else" can be used with "when" in case statement.

# when num2.to_f, 9 / 0 = Infinity
# when num2.to_i, 9 / 0 => ZeroDivisionError
# How to fix it?
# => It's not a problem, it's how Ruby is designed.
# Ruby tracks the IEEE 754 Floating Point Standard.
# Also read ZeroDivisionError in RubyDoc.

# Say, result is 23.0, how to make it show as an integer 23?

# Is there any possible that we can input something like "5*13" and the application
# can tell what num1, action, and num2 is?
# 1. split (get num1, action, and num2)
# 2. if input.include?("+") then num1 + num2
# Possible? Go try in intuitive_calculator.rb
