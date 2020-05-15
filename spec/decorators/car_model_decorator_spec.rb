require 'rails_helper'

describe CarModelDecorator do
  describe '#photo' do
    it 'should return placeholder if empty' do
      car_model = build(:car_model, photo: nil)

      result = car_model.decorate.photo_url 

      expect(result).to eq 'https://via.placeholder.com/150'
    end

    it 'should return photo url if has photo' do

    end
  end

  describe '#manufacture_name' do
    it 'should be blank if nil' do
      car_model = build(:car_model, manufacture: nil)

      result = car_model.decorate.manufacture_name

      expect(result).to eq ''
    end

    it 'should return manufacture name' do
      fiat = create(:manufacture, name: 'Fiat')
      car_model = build(:car_model, manufacture: fiat)

      result = car_model.decorate.manufacture_name

      expect(result).to eq 'Fiat'
    end
  end

end


