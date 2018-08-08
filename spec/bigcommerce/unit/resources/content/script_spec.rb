RSpec.describe Bigcommerce::Script do
  before(:each) { @script = Bigcommerce::Script }

  describe '.all' do
    it 'should hit the correct path' do
      expect(@script).to receive(:get).with(@script.path.build, {})
      @script.all
    end
  end
end
