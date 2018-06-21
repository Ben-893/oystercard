require 'journey_log'

describe JourneyLog do
  it 'test' do
    expect(subject).to respond_to(:test).with(1).argument
  end
end
