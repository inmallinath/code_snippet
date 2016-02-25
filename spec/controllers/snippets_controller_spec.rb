require 'rails_helper'

RSpec.describe SnippetsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:snippet) {FactoryGirl.create(:snippet, {user: user}) }

  describe "#new" do
    before{ log_in(user) }
    it "instantiates a new Snippet object and set it to @snippet" do
      get :new
      expect(assigns(:snippet)).to be_a_new(Snippet)
    end
  end

  describe "#create" do
    let(:kind) {FactoryGirl.create(:kind)}
    before{ log_in(user) }
    context "with valid attributes" do
      def valid_request
        post :create, snippet: { title: "Test1", work: "blort", kind_id: kind.id}
      end

      it "creates a record in the database" do
        count_before = Snippet.count
        valid_request
        count_after = Snippet.count
        expect(count_after - count_before).to eq(1)
      end
    end

    context "with invalid attributes" do
      def invalid_request
        post :create, snippet: { title: nil }
      end

      it "doesn't create a record in the database" do
        count_before = Snippet.count
        invalid_request
        count_after = Snippet.count
        expect(count_after).to eq(count_before)
      end
    end
  end

  describe "#update" do
    before{ log_in(user) }
    context "with valid attributes" do
      before do
        patch :update, id: snippet.id, snippet: { title: "123" }
      end
      it "updates the record with new parameter(s)" do
        expect(snippet.reload.title).to eq("123")
      end
    end

    context "with invalid attributes" do
      before do
        patch :update, id: snippet.id, snippet: { title: nil }
      end

      it "doesn't update the record" do
        expect(snippet.reload.title).to eq(snippet.title)
      end
    end
  end
end
