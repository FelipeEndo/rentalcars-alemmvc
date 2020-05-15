require 'rails_helper'

describe CarModelPresenter do
  describe '#photo_tag' do
    it 'should be empty if not photo' do
      car_model = build(:car_model, photo: nil)

      result = CarModelPresenter.new(car_model.decorate).photo_tag

      expect(result).to include '<img class="card-img-top' 
      expect(result).to include 'https://via.placeholder.com/150'

    end

    it 'should render photo' do
      car_model = create(:car_model)
      photo_path = Rails.root.join('spec/support/car.png')
      car_model.photo.attach(io: File.open(photo_path), filename: 'car.png') 

      result = CarModelPresenter.new(car_model.decorate).photo_tag

      expect(result).to include '<img class="card-img-top' 
      expect(result).to include 'car.png' 
    end
  end
end
