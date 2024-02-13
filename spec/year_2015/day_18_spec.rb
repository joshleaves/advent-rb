require 'year_2015/day_18'

describe Year2015::Day18 do
  context 'when Part 1' do
    subject(:sample_one) do
      described_class.new(File.read('spec/year_2015/day_18_sample_one'), true)
    end

    it 'is correct after one step' do
      sample_one.step
      expect(sample_one.to_s).to eq("..##..\n..##.#\n...##.\n......\n#.....\n#.##..")
    end

    it 'is correct after two steps' do
      sample_one.step(2)
      expect(sample_one.to_s).to eq("..###.\n......\n..###.\n......\n.#....\n.#....")
    end

    it 'is correct after three steps' do
      sample_one.step(3)
      expect(sample_one.to_s).to eq("...#..\n......\n...#..\n..##..\n......\n......")
    end

    it 'is correct after four steps' do
      sample_one.step(4)
      expect(sample_one.to_s).to eq("......\n......\n..##..\n..##..\n......\n......")
    end

    it 'gives a final result' do
      sample_one.step(4)
      expect(sample_one.to_i).to eq(4)
    end
  end

  context 'when Part 2' do
    subject(:sample_two) do
      described_class.new(File.read('spec/year_2015/day_18_sample_two'))
    end

    it 'is correct after one step' do
      sample_two.step
      expect(sample_two.to_s).to eq("#.##.#\n####.#\n...##.\n......\n#...#.\n#.####")
    end

    it 'is correct after two steps' do
      sample_two.step(2)
      expect(sample_two.to_s).to eq("#..#.#\n#....#\n.#.##.\n...##.\n.#..##\n##.###")
    end

    it 'is correct after three steps' do
      sample_two.step(3)
      expect(sample_two.to_s).to eq("#...##\n####.#\n..##.#\n......\n##....\n####.#")
    end

    it 'is correct after four steps' do
      sample_two.step(4)
      expect(sample_two.to_s).to eq("#.####\n#....#\n...#..\n.##...\n#.....\n#.#..#")
    end

    it 'is correct after five steps' do
      sample_two.step(5)
      expect(sample_two.to_s).to eq("##.###\n.##..#\n.##...\n.##...\n#.#...\n##...#")
    end

    it 'gives a final result' do
      sample_two.step(5)
      expect(sample_two.to_i).to eq(17)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2015/day_18_input')
    end

    it 'correctly answers part 1' do
      result_one = described_class.new(input_data, true)
      result_one.step(100)
      expect(result_one.to_i).to eq(821)
    end

    it 'correctly answers part 2' do
      result_two = described_class.new(input_data)
      result_two.step(100)
      expect(result_two.to_i).to eq(886)
    end
  end
end
