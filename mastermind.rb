class Mastermind

  def initialize
    @secret_code = generate_code
    display_code
    guess_code
  end

  # Generate random sequence of numbers
  def generate_code
    i = 0
    secret_code = Array.new(4)
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
    guess.each_with_index do |item, index|
      if (@secret_code[index] == item)
        @feedback[index] = "1"
      elsif (@secret_code.include?(item))
        if (guess.rindex(item) != index)
          @feedback[index] = "0"
        end
      end
    end
    @feedback
  end

  private
  # Displays generated code. For debugging purposes
  def display_code
    p @secret_code
  end
end

Mastermind.new