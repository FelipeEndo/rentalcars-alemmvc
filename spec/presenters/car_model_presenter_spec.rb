require 'rails_helper'

describe CarModelPresenter do
  describe '#manufacture_name' do
    it 'should be blank if nil' do
      car_model = build(:car_model, manufacture: nil)

      result = CarModelPresenter.new(car_model).manufacture_name

      expect(result).to eq ''
    end

    it 'should return manufacture name' do
      fiat = create(:manufacture, name: 'Fiat')
      car_model = build(:car_model, manufacture: fiat)

      result = CarModelPresenter.new(car_model).manufacture_name

      expect(result).to eq 'Fiat'
    end
  end

  describe '#photo_tag' do
    it 'should be empty if not photo' do
      car_model = build(:car_model, photo: nil)

      result = CarModelPresenter.new(car_model).photo_tag

      expect(result).to eq ''

    end

    it 'should render photo' do
      car_model = create(:car_model)
      photo_path = Rails.root.join('spec/support/car.png')
      car_model.photo.attach(io: File.open(photo_path), filename: 'car.png') 

      result = CarModelPresenter.new(car_model).photo_tag

      expect(result).to include '<img class="card-img-top' 
      expect(result).to include 'car.png' 
    end
  end
end
