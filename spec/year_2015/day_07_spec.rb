require 'year_2015/day_07'

describe Year2015::Day07 do
  context 'when Part 1' do
    subject(:sample_one) do
      {
        'd' => 72,
        'e' => 507,
        'f' => 492,
        'g' => 114,
        'h' => 65412,
        'i' => 65079,
        'x' => 123,
        'y' => 456
      }
    end

    it 'assigns values to wires' do
      circuit = described_class.new(File.read('spec/year_2015/day_07_sample_one'), true)

      sample_one.each do |wire, value|
        expect(circuit.wires[wire].to_i).to eq(value)
      end
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2015/day_07_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).wires['a'].to_i).to eq(46065)
    end

    it 'correctly answers part 2' do
      circuit = described_class.new(input_data)
      circuit.wires['b'].instance_eval{ @to_i = 46065 }
      expect(circuit.wires['a'].to_i).to eq(14134)
    end
  end
end
