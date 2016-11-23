class Sticks
  attr_accessor :stick_amount, :p_1_s_t, :p_2_s_t, :a_i

  def initialize(stick_amount, p_1_s_t, p_2_s_t, a_i)
    @stick_amount = stick_amount
    @p_1_s_t = p_1_s_t
    @p_2_s_t = p_2_s_t
    @a_i = a_i
  end

  def get_ai_pickup_sticks
    if @stick_amount > 5
      @a_i = rand(1..5)
    else
      @a_i = 5
    end
  end

  def p_1_stick_change(p_1)
    @p_1_s_t += p_1
    @stick_amount -= p_1
  end

  def p_2_stick_change(p_2)
    @p_2_s_t += p_2
    @stick_amount -= p_2
  end
end


game = Sticks.new(50, 0, 0, rand(1..5))




until game.stick_amount <= 0.to_i do
  puts "There are #{game.stick_amount} sticks on the table."
  puts "Player One, pick up 1-5 sticks"
    p_1 = gets.chomp.to_i
  if p_1 > 5
    puts "Player One, pick up 1-5 sticks or you will forfiet your turn and one stick will be added."
      p_1 = gets.chomp.to_i
      game.stick_amount += 1
  elsif p_1 < 1
    puts "Player One, pick up 1-5 sticks or your turn will be forfiet and one stick will be added."
      p_1 = gets.chomp.to_i
      game.stick_amount += 1
  else
      game.p_1_stick_change(p_1)
  end
  puts "There are #{game.stick_amount} sticks on the table"
  puts "Player Two, pick up 1-5 sticks"
  game.get_ai_pickup_sticks
  p_2 = game.a_i
  puts p_2
  game.p_2_stick_change(p_2)
end
puts "GAME OVER MOTHAFUCKA"