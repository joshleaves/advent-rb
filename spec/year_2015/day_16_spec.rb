require 'year_2015/day_16'

describe Year2015::Day16 do
  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2015/day_16_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(373)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(260)
    end
  end
end
