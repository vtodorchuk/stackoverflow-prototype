RSpec.describe Question, type: :model do
  context 'validation' do 
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
  end

  context 'associations' do 
    it { should have_many :answers }
  end
end