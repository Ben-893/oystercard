class Journey

  attr_reader :history, :entry_station

  def initialize
    @history = []
  end

  def start(entry_station)
    @history << { entry: entry_station }
    @entry_station = entry_station
  end

  def finish(exit_station)
    @history.last[:exit] = exit_station
    @entry_station = nil
  end

  def fare
    # penaltiy fare if touchout but no touchin and touchin twice.
  end

  def complete?
    !entry_station
  end
end
