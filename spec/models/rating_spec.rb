require 'rails_helper'

RSpec.describe Rating, type: :model do
  it { should have_many :topics }
  it { should have_many :posts }

  describe '.update_rating' do
    it 'takes a severity string and returns a severity with that rating' do
      rating_string = 'PG'
      rating = Rating.create(severity: 'PG')
      expect(Rating.update_rating(rating_string)).to eq(rating)
    end
  end
end
