# frozen_string_literal: true

RSpec.describe Waylon::Skills::Jokes do
  it { is_expected.to route("tell me a joke").to(:tell_a_joke) }
  it "tells jokes" do
    send_message("tell me a joke")
    expect(replies.last).to be_a(String)
  end
end
