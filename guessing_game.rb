class GuessingGame
  attr_accessor :user_number, :computer_number, :number_of_guesses

  def init
    @number_of_guesses = 0
    @computer_number = random_number
  end

  def puts_name(name)
    puts "Hello #{name}!"
  end

  def get_name
    puts "What's your name"
    name = gets.chomp
    puts_name(name)
  end

  def random_number
    Random.rand(10)
    # 2
  end

  def get_number
    puts 'Write a number between 0 and 10'
    number = gets.chomp
    number.to_i
  end

  def compare_numbers(user_number, computer_number)
    if user_number == computer_number
      return 'won'
    elsif user_number > computer_number
      @number_of_guesses += 1
      return 'high'
    else
      @number_of_guesses += 1
      return 'low'
    end
  end

  def start_game
    get_name
    user_number = get_number
    computer_number = random_number
    compare_numbers(user_number, computer_number)
  end
end
