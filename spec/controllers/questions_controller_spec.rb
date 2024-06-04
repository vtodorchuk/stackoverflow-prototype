RSpec.describe QuestionsController, type: :controller do
  let(:question) { create(:question) }

  describe 'GET #index' do
    let(:questions) { create_list(:question, 2) }

    before { get :index }

    it { expect(response).to render_template :index }
    it { expect(assigns(:questions)).to match_array(questions) }
  end

  describe 'GET #show' do
    before { get :show, params: { id: question }}

    it { expect(response).to render_template :show }
    it { expect(assigns(:question)).to eq(question) }
  end

  describe 'GET #new' do
    before { get :new }

    it { expect(response).to render_template :new }
    it { expect(assigns(:question)).to be_a_new(Question) }
  end

  describe 'GET #edit' do 
    before { get :edit, params: { id: question }}

    it { expect(response).to render_template :edit }
    it { expect(assigns(:question)).to eq(question) }
  end

  describe 'POST #create' do
    context 'when params are valid' do
      it 'creates the question' do
        expect { post :create, params: { question: attributes_for(:question) } }.to change(Question, :count).by(1)
      end

      it 'redirects to question' do
        post :create, params: { question: attributes_for(:question) }
        expect(response).to redirect_to question_path(assigns(:question))
      end
    end

    context 'when params are invalid' do
      it 'does not create the question' do
        expect { post :create, params: { question:attributes_for(:invalid_question) } }.to_not change(Question, :count)
      end

      it 'redirects to question edit with errors messages' do
        post :create, params: { question: attributes_for(:invalid_question) }
        expect(response).to redirect_to new_question_path
      end
    end
  end

  describe 'PATCH #update' do
    let(:new_title) { 'new_title' }
    let(:new_body) { 'new_body' }

    context 'when params are valid' do
      before { patch :update, params: { id: question, question: { title: new_title, body: new_body } } }

      it 'changes question title' do
        question.reload
        expect(question.title).to eq(new_title)
        expect(question.body).to eq(new_body)
      end

      it { expect(response).to redirect_to question }
    end

    context 'when params are invalid' do
      it 'redirects to question with errors messages' do
        patch :update, params: { id: question, question: attributes_for(:invalid_question) }
        expect(response).to redirect_to edit_question_path(assigns(:question))
      end
    end
  end

  describe 'DELETE #destroy' do
    before { question }
    
    it 'destroys the question' do
      expect { delete :destroy, params: { id: question } }.to change(Question, :count).by(-1)
    end

    it 'redirect to index view' do
      delete :destroy, params: { id: question }
      expect(response).to redirect_to questions_path
    end
  end
end
