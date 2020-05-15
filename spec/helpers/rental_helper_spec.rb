require 'rails_helper'

describe RentalHelper do
  describe '#status' do
    it 'should render green when ongoing' do
      # Arrange
      rental = build(:rental, status: :ongoing) 
      # Act
      result = helper.status(rental) 
      # Assert
      expect(result).to eq('<span class="badge badge-success">em andamento</span>')
    end

    it 'should render green when scheduled' do
      # Arrange
      rental = build(:rental, status: :scheduled) 
      # Act
      result = helper.status(rental) 
      # Assert
      expect(result).to eq('<span class="badge badge-info">agendada</span>')
    end
  end
end
