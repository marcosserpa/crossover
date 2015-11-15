require 'byebug'

class NumberPrettifier

  # Number of digits each magnitude has
  MILLION_DIGITS = [7, 8, 9]
  BILLION_DIGITS = [10, 11, 12]
  TRILLION_DIGITS = [13, 14, 15]

  class << self

    def prettify(number = nil)
      if number.nil?
        parameter = false
      else
        parameter = true
        number = number.to_s
      end

      begin
        unless parameter
          puts "Hi pseudo-jedi! This is the number prettifier. Enter a number with more than 6 digits and wich is less than or equal to 999999999999999 (999 trillion):"
          number = gets.chomp
        end

        parameter = false
      end until verify_input(number)

      truncate_number(number.to_s)
    end


    private

    # Test if the input is a valid number
    def verify_input(number)
      case
      when number.empty?
        puts "You must provide a number, young padawan!"
        return false
      when number.match(/[^\d.]+/)
        puts "Hey! We have a non-digit character here! Did you not read my request, zippy?"
        return false
      when number.gsub(/\.+?\d./, '').size > 15
        puts "You must provide a number which is less than or equal to 999.999.999.999.999 (but without the dots, young!)"
        return false
      end

      true
    end

    # Truncate the number according with the short scale
    def truncate_number(number)
      int_part = number.gsub(/\.+?\d./, '')
      return number if int_part.size < 7

      if MILLION_DIGITS.include? int_part.size
        "#{ verify_magnitude(int_part, -7) }M"
      elsif BILLION_DIGITS.include? int_part.size
        "#{ verify_magnitude(int_part, -10) }B"
      else
        "#{ verify_magnitude(int_part, -13) }T"
      end
    end

    # Remove all decimal digits after it's first; position (it's absolute value) is the first digit that defines this magnitude, when coming
    # from a less magnitude
    def verify_magnitude(number, position)
      trunc_i = number.dup.insert(position, '.').to_i
      trunc_f = (number.insert(position, '.').to_f * 10).truncate / 10.0

      trunc_i == trunc_f ? trunc_i : trunc_f
    end

  end

end
