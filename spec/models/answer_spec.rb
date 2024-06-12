RSpec.describe Answer, type: :model do
  context 'validation' do 
    it { should validate_presence_of :body }
  end

  context 'associations' do 
    it { should belong_to :question }
  end
end