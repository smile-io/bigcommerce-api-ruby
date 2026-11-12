RSpec.describe Bigcommerce::Resource do
  describe '.property' do
    it 'reads properties named after Hash methods' do
      address = Bigcommerce::CustomerAddress.new(count: 3, zip: '12345')
      rule = Bigcommerce::BulkPricingRule.new(min: 1, max: 10)
      option = Bigcommerce::Option.new(values: [{ id: 1 }])
      mapping = Bigcommerce::GoogleProductSearchMapping.new(size: 'XL')

      expect(address.count).to eq 3
      expect(address.zip).to eq '12345'
      expect(rule.min).to eq 1
      expect(rule.max).to eq 10
      expect(option.values).to eq [{ id: 1 }]
      expect(mapping.size).to eq 'XL'
    end

    it 'returns nil for an unset property named after a Hash method' do
      expect(Bigcommerce::CustomerAddress.new.count).to be_nil
      expect(Bigcommerce::CustomerAddress.new.zip).to be_nil
    end
  end
end
