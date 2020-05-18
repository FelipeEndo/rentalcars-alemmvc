require 'rails_helper'

describe RentalPresenter do
  describe '#status' do
    it 'should be sucess badge if status is ongoing' do
      rental = build(:rental, status: :ongoing)

      result = described_class.new(rental).status_badge

      expect(result).to eq('<span class="badge badge-success">em andamento</span>')
    end

    it 'should be info badge if status is scheduled' do
      rental = build(:rental, status: :scheduled)

      result = described_class.new(rental).status_badge

      expect(result).to eq('<span class="badge badge-info">agendada</span>')
    end

    it 'should be light badge if status is in_review' do
      rental = build(:rental, status: :in_review)

      result = described_class.new(rental).status_badge

      expect(result).to eq('<span class="badge badge-light">em revisão</span>')
    end

    it 'should be primary badge if status is finalized' do
      rental = build(:rental, status: :finalized)

      result = described_class.new(rental).status_badge

      expect(result).to eq('<span class="badge badge-primary">finalizada</span>')
    end
  end
end
