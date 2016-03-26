require 'spec_helper'

RSpec.describe Image, type: 'model' do
  describe "Image#blur instance method" do
    it "should perform a successful single-pixel blur" do
      input = [
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 1, 0, 0, 0],
        [1, 0, 0, 0, 0, 0, 0]
      ]

      expected = [
        [0, 0, 1, 0, 0, 0, 0],
        [0, 1, 1, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 1, 1],
        [0, 0, 0, 1, 0, 0, 1],
        [1, 0, 1, 1, 1, 0, 0],
        [1, 1, 0, 1, 0, 0, 0]
      ]

      image = Image.new(input)

      expect(image.blur.pixels).to eq expected
    end

    it "should perform a two-pixel blur successfully" do
      input = [
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 1, 0, 0, 0],
        [1, 0, 0, 0, 0, 0, 0]
      ]

      expected = [
        [0, 1, 1, 1, 0, 0, 0],
        [1, 1, 1, 1, 1, 0, 1],
        [0, 1, 1, 1, 0, 1, 1],
        [0, 0, 1, 1, 1, 1, 1],
        [1, 0, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 0, 0]
      ]

      image = Image.new(input)

      expect(image.blur(2).pixels).to eq expected
    end
  end
end
