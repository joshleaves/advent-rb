require 'year_2015/day_12'

describe Year2015::Day12 do
  subject do
    Year2015::Day12
  end

  context 'Part 1' do
    it 'counts the value of the JSON data' do
      {
        '[1,2,3]' => 6,
        '{"a":2,"b":4}' => 6,
        '[[[3]]]' => 3,
        '{"a":{"b":4},"c":-1}' => 3,
        '{"a":[-1,1]}' => 0,
        '[-1,{"a":1}]' => 0,
        '[]' => 0,
        '{}' => 0
      }.each do |input, result|
        expect(subject.new(input, true).to_i).to eq(result)
      end
    end
  end

  context 'Part 2' do
    it 'counts the value of the JSON data' do
      {
        '[1,2,3]' => 6,
        '[1,{"c":"red","b":2},3]' => 4,
        '{"d":"red","e":[1,2,3,4],"f":5}' => 0,
        '[1,"red",5]' => 6
      }.each do |input, result|
        expect(subject.new(input).to_i).to eq(result)
      end
    end
  end

  context 'Results' do
    subject do
      File.read('spec/year_2015/day_12_input')
    end

    it 'correctly answers part 1' do
      expect(Year2015::Day12.new(subject, true).to_i).to eq(111754)
    end

    it 'correctly answers part 2' do
      expect(Year2015::Day12.new(subject).to_i).to eq(65402)
    end
  end
end
