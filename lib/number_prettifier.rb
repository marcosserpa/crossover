class NumberPrettifier

  class << self

    def prettify(number = nil)
      unless not number.nil?
        begin
          puts "Hi pseudo-jedi! This is the number prettifier. Enter a number with more than 6 digits and wich is less than or equal to 999999999999999 (999 trillion):"
          number = gets.chomp
        end until verify_input(number)
      end

      truncate_number(number.to_s)
    end


    private

    # Test if the input is a valid number
    def verify_input(number)
      raise "You must provide a number, young padawan!" if number.empty?
      raise "You must provide a number which is less than or equal to 999.999.999.999.999 (but without the dots, young!)" if number.to_i > 999999999999999

      true
    end

    # Truncate the number according with the short scale
    def truncate_number(number)
      return number if number.size < 7

      if [7, 8, 9].include? number.size
        "#{ verify_magnitude(number, -7) }M"
      elsif [10, 11, 12].include? number.size
        "#{ verify_magnitude(number, -10) }B"
      else
        "#{ verify_magnitude(number, -13) }T"
      end
    end

    # Remove all decimal digits after it's first
    def verify_magnitude(number, position)
      trunc_i = number.dup.insert(position, '.').to_i
      trunc_f = (number.insert(position, '.').to_f * 10).truncate / 10.0

      trunc_i == trunc_f ? trunc_i : trunc_f
    end

  end

end
