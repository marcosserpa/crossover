require 'byebug'

class NumberPrettifier

  class << self

    def prettify
      puts "Hi pseudo-jedi! This is the number prettifier. Enter a number with more than 6 digits and wich is less than or equal to 999999999999999 (999 trillion):"
      number = gets.chomp
    end


    private

    def verify_input(number)
      begin
        raise "You must to provide a number, young padawan!" if number.empty?
        raise "You must to provide a number with more than 6 digits." if number.size < 7
        raise "You must to provide a number which is less than or equal to 999.999.999.999.999 (but without the dots, young!)" if number.to_i > 999999999999999
      rescue RuntimeError => e
        false
      end

      true
    end

  end

end
