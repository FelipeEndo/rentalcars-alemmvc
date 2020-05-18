class RentalScheduler
  def initialize(rental)
    @rental = rental
  end

  def schedule
    return false unless subsidiary?

    rental.status = :scheduled
    rental.price_projection = @rental.calculate_price_projection
    rental.save
  end

  private

  attr_reader :rental

  def subsidiary?
    !rental.subsidiary.nil?
  end

   
end
