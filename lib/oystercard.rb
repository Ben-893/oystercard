class Oystercard

  attr_reader :balance, :journeys

  MAX_BALANCE = 90
  MIN_BALANCE = Journey::MIN_FARE

  def initialize
    @balance = 0
  end

  def top_up(amount)
    message = "Maximum limit of £#{MAX_BALANCE} exceeded."
    raise message if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in
    message = "Insufficient Funds: Must have at least £#{MIN_BALANCE}"
    raise message if balance < MIN_BALANCE
  end

  def touch_out
    deduct(MIN_BALANCE)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
