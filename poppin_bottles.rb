@leftover_caps = 0
@leftover_empties = 0
@total_bottles = 0
@current_bottles = 0

def receive_money(money)
  @total_bottles = money / 2
  @leftover_caps = @leftover_empties = @total_bottles
  recycle()
end

def recycle()

  @current_bottles += (@leftover_caps / 4) + (@leftover_empties / 2)

  @leftover_caps %= 4
  @leftover_empties %= 2

  @total_bottles += @current_bottles

  @leftover_caps += @current_bottles
  @leftover_empties += @current_bottles

  @current_bottles = 0


  if @leftover_caps < 4 && @leftover_empties < 2
    return
  else
    recycle()
  end
end

def poppin_bottles
  while true
    @leftover_caps = 0
    @leftover_empties = 0
    @total_bottles = 0
    @current_bottles = 0

    puts "Welcome to the Poppin' Bottles Recycling program."
    puts "1 for new recycle"
    puts "2 to quit"
    print "Please enter your selection: "
    selection = gets.chomp

    case selection
    when "1"
      puts "Enter the amount of money the customer wants to spend in full dollars."
      money = gets.chomp.to_i
      receive_money money
      puts "You get #{@total_bottles} total bottles."
      puts "You have #{@leftover_caps} caps and #{@leftover_empties} empties left over."
    when "2"
      exit
    end
  end
end

poppin_bottles
