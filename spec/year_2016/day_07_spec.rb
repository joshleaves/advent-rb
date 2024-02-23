require 'year_2016/day_07'

describe Year2016::Day07 do
  context 'when Part 1' do
    subject(:sample_one) do
      {
        'abba[mnop]qrst' => be_truthy,
        'abcd[bddb]xyyx' => be_falsey,
        'aaaa[qwer]tyui' => be_falsey,
        'ioxxoj[asdfgh]zxcvbn' => be_truthy
      }
    end

    it 'can detect IPv7 addresses that support TLS' do
      object = described_class.new('')
      sample_one.each do |input, result|
        expect(object.address_supports_tls?(input)).to result
      end
    end

    it 'gives a final result' do
      expect(described_class.new(sample_one.keys.join("\n")).tls_addresses_count).to eq(2)
    end
  end

  context 'when Part 2' do
    subject(:sample_two) do
      {
        'aba[bab]xyz' => be_truthy,
        'xyx[xyx]xyx' => be_falsey,
        'aaa[kek]eke' => be_truthy,
        'zazbz[bzb]cdb' => be_truthy
      }
    end

    it 'can detect IPv7 addresses that support SSL' do
      object = described_class.new('')
      sample_two.each do |input, result|
        expect(object.address_supports_ssl?(input)).to result
      end
    end

    it 'gives a final result' do
      expect(described_class.new(sample_two.keys.join("\n")).ssl_addresses_count).to eq(3)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_07_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data).tls_addresses_count).to eq(118)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).ssl_addresses_count).to eq(260)
    end
  end
end
