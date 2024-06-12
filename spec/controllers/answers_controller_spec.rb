RSpec.describe AnswersController, type: :controller do
  let(:question) { create(:question) }
  let(:answer) { create(:answer, question: question) }
  
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new answer' do
        expect {
          post :create, params: { question_id: question.id, answer: attributes_for(:answer) }
        }.to change(Answer, :count).by(1)
      end

      it 'redirects to the question' do
        post :create, params: { question_id: question.id, answer: attributes_for(:answer) }
        expect(response).to redirect_to(question)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new answer' do
        expect {
          post :create, params: { question_id: question.id, answer: attributes_for(:answer, body: nil) }
        }.not_to change(Answer, :count)
      end

      it 'redirects to the question with errors' do
        post :create, params: { question_id: question.id, answer: attributes_for(:answer, body: nil) }
        expect(response).to redirect_to(question)
        expect(flash[:alert]).to include("Body can't be blank")
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'updates the answer' do
        patch :update, params: { question_id: question.id, id: answer.id, answer: { body: 'Updated body' } }
        answer.reload
        expect(answer.body).to eq('Updated body')
      end

      it 'redirects to the question' do
        patch :update, params: { question_id: question.id, id: answer.id, answer: { body: 'Updated body' } }
        expect(response).to redirect_to(question)
      end
    end

    context 'with invalid attributes' do
      it 'does not update the answer' do
        patch :update, params: { question_id: question.id, id: answer.id, answer: { body: nil } }
        answer.reload
        expect(answer.body).not_to be_nil
      end

      it 'redirects to the question with errors' do
        patch :update, params: { question_id: question.id, id: answer.id, answer: { body: nil } }
        expect(response).to redirect_to(question)
        expect(flash[:alert]).to include("Body can't be blank")
      end
    end
  end

  describe 'DELETE #destroy' do
    before { answer }

    it 'deletes the answer' do
      expect {
        delete :destroy, params: { question_id: question.id, id: answer.id }
      }.to change(Answer, :count).by(-1)
    end

    it 'redirects to the question' do
      delete :destroy, params: { question_id: question.id, id: answer.id }
      expect(response).to redirect_to(question)
    end
  end

  private

  def attributes_for(factory_name, overrides = {})
    FactoryBot.attributes_for(factory_name, overrides)
  end
end
