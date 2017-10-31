require 'rails_helper'

RSpec.describe User, type: :model do
  subject!(:waffles) { FactoryBot.create(:user) }

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should allow_value(nil).for(:password) }

  describe "::find_by_credentials" do

    let(:blob){ FactoryBot.create(:user) { username "blob" } }

    context "when given correct parameters" do
      it "returns user" do
        expect(User.find_by_credentials("waffles","hello_world")).to eq(waffles)
      end

    end

    context "when given incorrect parameters" do
      it "returns nil for username that doesn't exist" do
        expect(User.find_by_credentials("camelfan45", "dramadaries")).to be_nil
      end

      it "returns nil for incorrect password" do
        expect(User.find_by_credentials("waffles", "dramadaries")).to be_nil
      end
    end
  end

end
