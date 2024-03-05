require 'year_2016/day_09'

describe Year2016::Day09 do
  context 'when Part 1' do
    subject(:sample_one) do
      {
        'ADVENT' => ['ADVENT', 6],
        'A(1x5)BC' => ['ABBBBBC', 7],
        '(3x3)XYZ' => ['XYZXYZXYZ', 9],
        'A(2x2)BCD(2x2)EFG' => ['ABCBCDEFEFG', 11],
        '(6x1)(1x3)A' => ['(1x3)A', 6],
        'X(8x2)(3x3)ABCY' => ['X(3x3)ABC(3x3)ABCY', 18]
      }
    end

    it 'expands a string' do
      sample_one.each do |input, result|
        expect(described_class.new(input, true).to_s).to eq(result.first)
      end
    end

    it 'gives a final result' do
      sample_one.each do |input, result|
        expect(described_class.new(input, true).to_i).to eq(result.last)
      end
    end
  end

  context 'when Part 2' do
    subject(:sample_two) do
      {
        '(3x3)XYZ' => 9,
        'X(8x2)(3x3)ABCY' => 20,
        '(27x12)(20x12)(13x14)(7x10)(1x12)A' => 241_920,
        '(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN' => 445
      }
    end

    it 'gives a final result' do
      sample_two.each do |input, result|
        expect(described_class.new(input).to_i).to eq(result)
      end
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_09_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(183_269)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(11_317_278_863)
    end
  end
end
