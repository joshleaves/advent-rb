require 'year_2016/day_04'

describe Year2016::Day04 do
  context 'when Part 1' do
    subject(:sample_one) do
      {
        'aaaaa-bbb-z-y-x-123[abxyz]' => 123,
        'a-b-c-d-e-f-g-h-987[abcde]' => 987,
        'not-a-real-room-404[oarel]' => 404,
        'totally-real-room-200[decoy]' => 0
      }
    end

    it 'gives a final result' do
      sample_one.each do |input, result|
        expect(described_class.new(input, true).to_i).to eq(result)
      end
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_04_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(158_835)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(993)
    end
  end
end
