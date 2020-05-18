require 'rails_helper'

describe RentalScheduler do
  describe '#schedule' do
    it 'should not schedule without subsidiary' do
      rental =  build(:rental, subsidiary: nil)

      result = RentalScheduler.new(rental).schedule

      expect(result).to be false
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
