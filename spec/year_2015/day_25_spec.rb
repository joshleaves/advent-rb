require 'year_2015/day_25'

describe Year2015::Day25 do
  context 'when Part 1' do
    # rubocop:disable RSpec/ExampleLength
    it 'gives a final result' do
      [
        [20_151_125, 18_749_137, 17_289_845, 30_943_339, 10_071_777, 33_511_524],
        [31_916_031, 21_629_792, 16_929_656, 7_726_640, 15_514_188, 4_041_754],
        [16_080_970, 8_057_251, 1_601_130, 7_981_243, 11_661_866, 16_474_243],
        [24_592_653, 32_451_966, 21_345_942, 9_380_097, 10_600_672, 31_527_494],
        [77_061, 17_552_253, 28_094_349, 6_899_651, 9_250_759, 31_663_883],
        [33_071_741, 6_796_745, 25_397_450, 24_659_492, 1_534_922, 27_995_004]
      ].each_with_index do |numbers, i|
        numbers.each_with_index do |number, j|
          expect(described_class.new.to_i(j + 1, i + 1)).to eq(number)
        end
      end
    end
    # rubocop:enable RSpec/ExampleLength
  end

  context 'when Results' do
    it 'correctly answers part 1' do
      expect(described_class.new.to_i(3029, 2947)).to eq(19_980_801)
    end
  end
end
