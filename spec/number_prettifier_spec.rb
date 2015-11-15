require 'number_prettifier'

describe NumberPrettifier do

  describe '.verify_input' do
    context 'not given a number' do
      it "returns a message" do
        expect{ NumberPrettifier.send(:verify_input, '') }.to raise_error(RuntimeError, "You must provide a number, young padawan!")
      end
    end

    context "given a number" do
      it "has less than 7 digits" do
        expect(NumberPrettifier.send(:verify_input, '123456')).to be(true)
      end
      
      it "is greater than 999.999.999.999.999" do
        expect{ NumberPrettifier.send(:verify_input, '1000000000000000') }.to raise_error(RuntimeError, "You must provide a number which is less than or equal to 999.999.999.999.999 (but without the dots, young!)")
      end
    end

    context "given a valid number" do
      it "returns true" do
        expect(NumberPrettifier.send(:verify_input, '83487893843789')).to be(true)
      end
    end
  end

  describe '.truncate_number' do
    context "number has 7, 8 or 9 digits" do
      it "returns the prettified Millions" do
        expect(NumberPrettifier.send(:truncate_number, '77000000')).to eql("77M")
      end
    end

    context "number has 10, 11 or 12 digits" do
      it "returns the prettified Billions" do
        expect(NumberPrettifier.send(:truncate_number, '8800000000')).to eql("8.8B")
      end
    end

    context "number has 13, 14 or 15 digits" do
      it "returns the prettified Trillions" do
        expect(NumberPrettifier.send(:truncate_number, '99990000000000')).to eql("99.9T")
      end
    end
  end

  describe ".verify_magnitude" do
    context "given a next magnitude of zeros" do
      it "returns a integer short scale" do
        expect(NumberPrettifier.send(:verify_magnitude, '99000000', -7)).to eql(99)
      end
    end

    context "given a next magnitude of non-zeros" do
      it "returns a float short scale" do
        expect(NumberPrettifier.send(:verify_magnitude, '43700000000000', -13)).to eql(43.7)
      end
    end
  end

end
