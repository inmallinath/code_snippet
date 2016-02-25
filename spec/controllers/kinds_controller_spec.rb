require 'rails_helper'

RSpec.describe KindsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:kind) {FactoryGirl.create(:kind)}

  describe "#new" do
    before{ log_in(user) }
    it "instantiates a new Kind object and set it to @kind" do
      get :new
      expect(assigns(:kind)).to be_a_new(Kind)
    end
  end

  describe "#create" do
    before{ log_in(user) }
    context "with valid attributes" do
      def valid_request
        post :create, kind: { language: "Ruby"}
      end

      it "creates a record in the database" do
        count_before = Kind.count
        valid_request
        count_after = Kind.count
        expect(count_after - count_before).to eq(1)
      end
    end

    context "with invalid attributes" do
      def invalid_request
        post :create, kind: { language: nil}
      end

      it "doesn't create a record in the database" do
        count_before = Kind.count
        invalid_request
        count_after = Kind.count
        expect(count_after).to eq(count_before)
      end
    end
  end
end
