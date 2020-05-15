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

end


