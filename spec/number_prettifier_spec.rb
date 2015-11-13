require 'byebug'
require 'number_prettifier'

describe NumberPrettifier do

  describe '.verify_input' do
    context 'not given a number' do
      it "returns a message" do
        expect{ NumberPrettifier.send(:verify_input, '') }.to raise_error(RuntimeError, "You must to provide a number, young padawan!")
      end
    end

    context "given a number" do
      it "has less than 7 digits" do
        expect{ NumberPrettifier.send(:verify_input, '123456') }.to raise_error(RuntimeError, "You must provide a number with more than 6 digits.")
      end
      
      it "is greater than 999.999.999.999.999" do
        expect{ NumberPrettifier.send(:verify_input, '10000000000000') }.to raise_error(RuntimeError, "You must to provide a number which is less than or equal to 999.999.999.999 (but without the dots, young!)")
      end
    end
  end

end
