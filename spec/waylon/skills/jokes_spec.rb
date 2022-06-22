# frozen_string_literal: true

RSpec.describe Waylon::Skills::Jokes do
  it { is_expected.to route("tell me a joke").to(:tell_a_joke) }

  it "tells jokes" do
    send_message("tell me a joke")
    expect(replies.last).to be_a(String)
  end

  it "handles exceptions from the jokes API" do
    allow_any_instance_of(Faraday::Connection).to(
      receive(:get).with("https://icanhazdadjoke.com/").and_raise(Faraday::ParsingError, "foo")
    )

    expect { send_message("tell me a joke") }.not_to raise_exception
    expect(replies.last).to be_a(String)
  end
end
