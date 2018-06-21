require 'journey'

describe Journey do

  it { is_expected.to respond_to(:start).with(1).argument }

  it { is_expected.to respond_to(:finish).with(1).argument }

  it { is_expected.to respond_to(:fare) }

  describe '#initialize' do
    it 'initializes with an empty history array' do
      expect(subject.history).to eq([])
    end
  end

  describe '#start' do
    it 'stores the entry station in the history array' do
      subject.start("Oxford St")
      expect(subject.current_journey[:entry]).to eq "Oxford St"
    end
  end

  describe '#finish' do
    it 'stores the exit station in the history hash' do
      subject.start("Oxford St")
      subject.finish("Notting Hill")
      expect(subject.history).to eq [:entry => "Oxford St", :exit => "Notting Hill"]
    end
  end

  describe '#fare' do
    it 'Returns minimum fare upon journey completion' do
      subject.start("Oxford St")
      subject.finish("Notting Hill")
      expect(subject.fare).to eq described_class::MIN_FARE
    end
    it 'Returns penalty fare when there is no journey start' do
      subject.finish("Notting Hill")
      expect(subject.fare).to eq described_class::PENALTY_FARE
    end
    it 'Returns penalty fare when there is no journey end' do
      subject.start("Oxford St")
      expect(subject.fare).to eq described_class::PENALTY_FARE
    end
  end

end
