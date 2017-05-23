class Mastermind

  def initialize
    @initial_guess = 1122.to_s.split("")
    @winning_feedback = 1111.to_s.split("")
    @secret_code = generate_code
    @combination = generate_permutations
    guess_loop
  end

  def guess_loop
    index = 1
    puts "Turn number #{index} with code #{@initial_guess}"
    @feedback = compare_guess(@initial_guess, @secret_code)
    while (true)
      if (@feedback == @winning_feedback)
        puts "You've won! The code is #{@initial_guess}."
        break
      else
        index += 1
        puts "Length #{@combination.length}"
        refine_permutations
        random_number = rand(0...@combination.length)
        puts "Random number is #{random_number}. Length #{@combination.length}"
        @initial_guess = @combination[random_number]
        puts "Turn number #{index} with code #{@initial_guess}"
        @feedback = compare_guess(@initial_guess, @secret_code)
      end
    end
  end

  # Generate random sequence of numbers
  def generate_code
    secret_code = Array.new(4)
    i = 0
    while (i < 4)
      secret_code[i] = rand(1..6).to_s
      i += 1
    end
    secret_code
  end

  # Generate all possible permutations
  def generate_permutations
    combination = %w{1 2 3 4 5 6}
    combination.permutation(4).to_a
  end

  def refine_permutations
    index = 0
    while index < @combination.length
      if (compare_guess(@combination[index], @initial_guess) != @feedback)
        @combination.delete_at(index)
      else
        index += 1
      end
    end
  end

  # Compares player's guess with a @secret_code
  def compare_guess(guess, secret_code)
    feedback = Array.new(4, "-1")
    temp_secret = secret_code
    # Checks for magnitude and position coincidence
    guess.each_with_index do |item, index|
      if (temp_secret[index] == item)
        feedback[index] = "1"
        temp_secret[index] = "0"
      end
    end
    # Checks for magnitude coincidence
    guess.each_with_index do |item, index|
      if (feedback[index] == "-1")
        if (temp_secret.include?(item))
          feedback[index] = "0"
          temp_secret[temp_secret.index(item)] = "0"
        end
      end
    end
    feedback
  end

  private
  # Displays generated code. For debugging purposes
  def display_code
    p @secret_code
  end
end

Mastermind.new
