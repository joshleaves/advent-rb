require 'year_2015/day_12'

describe Year2015::Day12 do
  subject(:sample_one) do
    {
      '[1,2,3]' => 6,
      '{"a":2,"b":4}' => 6,
      '[[[3]]]' => 3,
      '{"a":{"b":4},"c":-1}' => 3,
      '{"a":[-1,1]}' => 0,
      '[-1,{"a":1}]' => 0,
      '[]' => 0,
      '{}' => 0
    }
  end

  context 'when Part 1' do
    it 'counts the value of the JSON data' do
      sample_one.each do |input, result|
        expect(described_class.new(input, true).to_i).to eq(result)
      end
    end
  end

  context 'when Part 2' do
    subject(:sample_two) do
      {
        '[1,2,3]' => 6,
        '[1,{"c":"red","b":2},3]' => 4,
        '{"d":"red","e":[1,2,3,4],"f":5}' => 0,
        '[1,"red",5]' => 6
      }
    end

    it 'counts the value of the JSON data' do
      sample_two.each do |input, result|
        expect(described_class.new(input).to_i).to eq(result)
      end
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2015/day_12_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(111754)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(65402)
    end
  end
end
