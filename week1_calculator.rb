puts "It's a tiny calulator, what would you like to do?"

loop do
  puts "===== please input your first number ====="
  num1 = gets.chomp

# what if input isn't a number?

  puts "===== what action would you like? (choose from +, -, *, /) ====="
  action = gets.chomp

# what if input isn't one of the four action?

  puts "===== What's your second number? ====="
  num2 = gets.chomp

  case action
  when "+"
    result = num1.to_f + num2.to_f
  when "-"
    result = num1.to_f - num2.to_f
  when "*"
    result = num1.to_f * num2.to_f
  when "/"
    result = num1.to_f / num2.to_i
# What if an user input isn't one of the above?
  end

# I want to put a visual effect here, and it looks like the calculator is calculating.
# Same concept as Mac's rotating color wheel.
# How?

# 9 / 0 = Infinity
# Shouldn't it be ZeroDivisionError?

# Is there any possible that we can input something like "5*13" and the application
# can tell what num1, action, and num2 is?
# 1. split (get num1, action, and num2)
# 2. include? (check which action was chosen)
# 3. conditions

  puts "#{num1} #{action} #{num2} = #{result}"
  puts "Would you like to do some more math? (y/n)"
  calculate_again = gets.chomp
  if calculate_again != "y"
    break
  end
end
