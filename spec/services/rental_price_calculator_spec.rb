require 'rails_helper'

describe RentalPriceCalculator do
  describe '#calculate' do

    let(:category) { create(:category, daily_rate: 10.0) }
      let(:client) { create(:client) }
      let(:subsidiary) { create(:subsidiary) }
      let(:car_model) { create(:car_model, category: category) }
      let(:car) { create(:car, car_model: car_model) }
      
    it 'should return daily_rate * 1 when the minimum_days is zero' do
      rental = build(:rental,
                     category: category,
                     client: client,
                     subsidiary: subsidiary,
                     start_date: Date.today,
                     end_date: Date.today)

      result = RentalPriceCalculator.calculate(rental)

      expect(result).to be 10.0

    end

    it 'should schedule' do
      category = create(:category)
      client = create(:client)
      subsidiary = create(:subsidiary)
      car_model = create(:car_model, category: category)
      create(:car, car_model: car_model)
      rental = build(:rental, category: category, client: client,
                    subsidiary: subsidiary)

      result = RentalScheduler.new(rental).schedule

      expect(result).to be true
      expect(rental).to be_persisted
      expect(rental).to be_scheduled
      expect(rental.price_projection).to be > 0

    end
  end
end

