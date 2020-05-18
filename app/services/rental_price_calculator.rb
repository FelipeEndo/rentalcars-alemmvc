class RentalPriceCalculator
  class << self
    def calculate(rental)
      calculate_price_projection(rental)
    end


    private

    def calculate_price_projection(rental)
      return 0 unless rental.start_date && rental.end_date && rental.category

      minimum_days(rental.end_date, rental.start_date) * daily_rate(rental.category)
    end


    def minimum_days(end_date, start_date)
      days = (end_date - start_date).to_i

      return 1 unless days > 0

      days
    end

    def daily_rate(category)
      category.daily_rate
    end
  end
end
