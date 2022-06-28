require 'rails_helper'

RSpec.describe Tabi, type: :model do
  it "Tabiモデルをnewしたとき, nilでないこと" do
    expect(Tabi.new).not_to eq(nil)
  end
end
