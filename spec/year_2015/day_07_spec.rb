require 'year_2015/day_07'

describe Year2015::Day07 do
  context 'Part 1' do
    subject do
      Year2015::Day07.new(File.read('spec/year_2015/day_07_sample_one'), true)
    end

    it 'assigns values to wires' do
      {
        'd' => 72,
        'e' => 507,
        'f' => 492,
        'g' => 114,
        'h' => 65412,
        'i' => 65079,
        'x' => 123,
        'y' => 456
      }.each do |wire, value|
        expect(subject.wires[wire].to_i).to eq(value)
      end
    end
  end

  context 'Results' do
    subject do
      File.read('spec/year_2015/day_07_input')
    end

    it 'correctly answers part 1' do
      expect(Year2015::Day07.new(subject, true).wires['a'].to_i).to eq(46065)
    end

    it 'correctly answers part 2' do
      machine = Year2015::Day07.new(subject)
      machine.wires['b'].instance_eval{ @to_i = 46065 }
      expect(machine.wires['a'].to_i).to eq(14134)
    end
  end
end
