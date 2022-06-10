require 'rails_helper'

RSpec.describe "Tabis", type: :request do
  describe "#show" do
    let(:user) { create(:user) }
    let(:tabi) { create(:tabi, user: user) }

    before do
      sign_in user
      get show_tabis_path(tabi.id)
    end

    it "tabi.titleを表示すること" do
      expect(response.body).to include tabi.title
    end

    it "tabi.user.nameを表示すること" do
      expect(response.body).to include tabi.user.name
    end

    it "tabi.start_dateを表示すること" do
      expect(response.body).to include tabi.start_date.to_s
    end

    it "tabi.contentを表示すること" do
      expect(response.body).to include tabi.content
    end

    it "tabi.addressを表示すること" do
      expect(response.body).to include tabi.address
    end

  end
end
