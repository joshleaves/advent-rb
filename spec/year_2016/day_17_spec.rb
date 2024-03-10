require 'year_2016/day_17'

describe Year2016::Day17 do
  context 'when Part 1' do
    it 'gives a final result' do
      {
        'ihgpwlah' => 'DDRRRD', 'kglvqrro' => 'DDUDRLRRUDRD', 'ulqzkmiv' => 'DRURDRUDDLLDLUURRDULRLDUUDDDRR'
      }.each do |input, result|
        expect(described_class.new(input).to_s).to eq(result)
      end
    end
  end

  context 'when Part 2' do
    it 'gives a final result' do
      {
        'ihgpwlah' => 370, 'kglvqrro' => 492, 'ulqzkmiv' => 830
      }.each do |input, result|
        expect(described_class.new(input).to_i).to eq(result)
      end
    end
  end

  context 'when Results' do
    subject(:input_data) do
      'mmsxrhfx'
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data).to_s).to eq('RLDUDRDDRR')
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(590)
    end
  end
end
