require 'year_2016/day_22'

describe Year2016::Day22 do
  context 'when Part 2' do
    subject(:sample_two) do
      <<~HEREDOC
        root@ebhq-gridcenter# df -h
        Filesystem            Size  Used  Avail  Use%
        /dev/grid/node-x0-y0   10T    8T     2T   80%
        /dev/grid/node-x0-y1   11T    6T     5T   54%
        /dev/grid/node-x0-y2   32T   28T     4T   87%
        /dev/grid/node-x1-y0    9T    7T     2T   77%
        /dev/grid/node-x1-y1    8T    0T     8T    0%
        /dev/grid/node-x1-y2   11T    7T     4T   63%
        /dev/grid/node-x2-y0   10T    6T     4T   60%
        /dev/grid/node-x2-y1    9T    8T     1T   88%
        /dev/grid/node-x2-y2    9T    6T     3T   66%
      HEREDOC
    end

    it 'gives a final result' do
      expect(described_class.new(sample_two).solve).to eq(7)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_22_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data).to_i).to eq(955)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).solve).to eq(246)
    end
  end
end
