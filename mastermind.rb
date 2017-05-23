class Mastermind

  def initialize
    @secret_code = generate_code
    display_code
    guess_code
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

  def guess_code
    @initial_guess = 1122.to_s.split("")
    p compare_guess(@initial_guess)
  end

  # Compares player's guess with a @secret_code
  def compare_guess(guess)
    @feedback = Array.new(4, "-1")
    temp_secret = @secret_code
    # Checks for magnitude and position coincidence
    guess.each_with_index do |item, index|
      if (temp_secret[index] == item)
        @feedback[index] = "1"
        temp_secret[index] = "0"
      end
    end
    # Checks for magnitude coincidence
    guess.each_with_index do |item, index|
      if (@feedback[index] == "-1")
        if (temp_secret.include?(item))
          @feedback[index] = "0"
          temp_secret[temp_secret.index(item)] = "0"
        end
      end
    end
    @feedback
  end

  def check_duplicates(item)
    @initial_guess.detect{ |item| @initial_guess.count(item) > 1}
  end

  private
  # Displays generated code. For debugging purposes
  def display_code
    p @secret_code
  end
end

Mastermind.new
