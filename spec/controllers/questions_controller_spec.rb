require 'spec_helper'

describe QuestionsController do

  context "when user not logged in" do
    describe "GET #index" do
      it "redirects to login page" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context "when user logged in" do
    let(:user) { FactoryGirl.create(:user) }
    subject { FactoryGirl.create(:question, owner: user) }
        
    before do
      sign_in user
    end

    describe "GET #index" do
      it "render :index view" do
        get :index
        expect(response).to render_template :index
      end

      it "assigns the requested question to subject" do
        get :index
        expect(assigns(:questions)).to eq([subject])
      end
    end

    describe "GET #show" do
      it "assigns the requested question to subject" do
        get :show, id: subject
        expect(assigns(:question)).to eq(subject)
      end

      it "renders the :show view" do
        get :show, id: subject
        expect(response).to render_template :show
      end
    end

    describe "GET #new" do
      it "assigns the requested question to new question" do
        get :new
        expect(assigns(:question)).to be_new_record 
      end
      
      it "renders the :new view" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "creates new object" do
          expect{
            post :create, question: FactoryGirl.attributes_for(:question)
          }.to change(Question, :count).by(1)
        end
      
        it "rendirects to index path" do
          post :create, question: FactoryGirl.attributes_for(:question)
          expect(response).to redirect_to questions_path
        end
      end
      
      context "with not valid attributes" do
        it "not save object to db" do
          expect{
            post :create, question: FactoryGirl.attributes_for(:invalid_question)
          }.to_not change(Question, :count)
        end
      
        it "render new view" do
          post :create, question: FactoryGirl.attributes_for(:invalid_question)
          expect(response).to render_template :new
        end
      end
    end

    describe "PATCH #update" do
      context "with valid attributes" do
        it "updates object" do
          expect{
            patch :update, id: subject, question: { name: 'new_question' }
          }.to change{ subject.reload.name }.to('new_question')
        end
      
        it "rendirects to index path" do
          patch :update, id: subject, question: { name: 'new_question' }
          expect(response).to redirect_to questions_path
        end
      end
      
      context "with not valid attributes" do
        it "not save object to db" do
          expect{
            patch :update, id: subject, question: FactoryGirl.attributes_for(:invalid_question)
          }.to_not change{ subject.name }
        end
      
        it "render edit view" do
          post :update, id: subject, question: FactoryGirl.attributes_for(:invalid_question)
          expect(response).to render_template :edit
        end
      end
    end

    describe "GET #edit" do
      it "assigns the requested question to subject" do
        get :edit, id: subject
        expect(assigns(:question)).to eq(subject)
      end
      
      it "renders the :edit view" do
        get :edit, id: subject
        expect(response).to render_template :edit
      end
    end

    describe 'DELETE #destroy' do
      before(:each) { @question = FactoryGirl.create :question, owner: user }

      it "deletes the question" do
        expect {
          delete :destroy, id: @question
        }.to change(Question, :count).by(-1)
      end

      it "redirects to questions#index" do
        delete :destroy, id: @question
        expect(response).to redirect_to questions_path
      end
    end
  end
end