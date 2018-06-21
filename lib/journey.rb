class Journey

  MIN_FARE = 1
  PENALTY_FARE = 6
  attr_reader :history, :current_journey

  def initialize
    @history = []
    @current_journey = {}
  end

  def start(entry_station)
    @current_journey[:entry] = entry_station
  end

  def finish(exit_station)
    @current_journey[:exit] = exit_station
    @history << @current_journey
  end

  def fare
    incomplete_journey? ? PENALTY_FARE : MIN_FARE
  end

  private

  def incomplete_journey?
    @current_journey[:entry].nil? || @current_journey[:exit].nil?
  end

end
