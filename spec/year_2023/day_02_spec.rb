require 'year_2023/day_02'

describe Year2023::Day02 do
  context 'when Part 1' do
    subject(:sample_one) do
      described_class.new(File.read('spec/year_2023/day_02_sample_one'), true)
    end

    it 'can tell if a line got too many red' do
      [be_falsey, be_falsey, be_truthy, be_truthy, be_falsey].each_with_index do |bool_value, i|
        expect(sample_one.lines[i].too_many_red?).to bool_value
      end
    end

    it 'can tell if a line got too many green' do
      [be_falsey, be_falsey, be_falsey, be_falsey, be_falsey].each_with_index do |bool_value, i|
        expect(sample_one.lines[i].too_many_green?).to bool_value
      end
    end

    it 'can tell if a line got too many blue' do
      [be_falsey, be_falsey, be_falsey, be_truthy, be_falsey].each_with_index do |bool_value, i|
        expect(sample_one.lines[i].too_many_blue?).to bool_value
      end
    end

    it 'can tell which lines are valid' do
      [be_truthy, be_truthy, be_falsey, be_falsey, be_truthy].each_with_index do |bool_value, i|
        expect(sample_one.lines[i].line_is_valid?).to bool_value
      end
    end

    it 'returns the game ID value' do
      [1, 2, 0, 0, 5].each_with_index do |num_value, i|
        expect(sample_one.lines[i].to_i).to eq(num_value)
      end
    end

    it 'gives a final result' do
      expect(sample_one.to_i).to eq(8)
    end
  end

  context 'when Part 2' do
    subject(:sample_two) do
      described_class.new(File.read('spec/year_2023/day_02_sample_two'))
    end

    it 'returns the fewest number of red required' do
      [4, 1, 20, 14, 6].each_with_index do |num_value, i|
        expect(sample_two.lines[i].red).to eq(num_value)
      end
    end

    it 'returns the fewest number of green required' do
      [2, 3, 13, 3, 3].each_with_index do |num_value, i|
        expect(sample_two.lines[i].green).to eq(num_value)
      end
    end

    it 'returns the fewest number of blue required' do
      [6, 4, 6, 15, 2].each_with_index do |num_value, i|
        expect(sample_two.lines[i].blue).to eq(num_value)
      end
    end

    it 'returns the cubes power' do
      [48, 12, 1560, 630, 36].each_with_index do |num_value, i|
        expect(sample_two.lines[i].to_i).to eq(num_value)
      end
    end

    it 'gives a final result' do
      expect(sample_two.to_i).to eq(2286)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2023/day_02_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(2076)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(70_950)
    end
  end
end
