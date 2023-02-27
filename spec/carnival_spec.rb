require 'spec_helper'

RSpec.describe Carnival do
  let(:carnival) {Carnival.new('1 month')}
  let(:ride1) {Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })}
  let(:ride2) {Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })}
  let(:ride3) {Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })}
  let(:visitor1) {Visitor.new('Bruce', 54, '$10')}
  let(:visitor2) {Visitor.new('Tucker', 36, '$5')}
  let(:visitor3) {Visitor.new('Penny', 64, '$15')}
  let(:visitor4) {Visitor.new('George', 55, '$20')}
  let(:visitor5) {Visitor.new('Krissy', 60, '$7')}


  describe '#initialize' do
    it 'can initialize' do
      expect(carnival).to be_instance_of(Carnival)
      expect(carnival.duration).to eq('1 month')
      expect(carnival.rides).to eq([])
    end
  end

  describe '#add_ride' do
    it 'can add a new ride to the rides array' do
      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      carnival.add_ride(ride3)

      expect(carnival.rides).to eq([ride1, ride2, ride3])
    end
  end

  describe '#most_popular' do
    it 'can determine which ride is most popular' do
      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      carnival.add_ride(ride3)

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor3.add_preference(:thrilling)
      visitor4.add_preference(:thrilling)
      visitor5.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride3.board_rider(visitor3)
      ride3.board_rider(visitor4)
      ride3.board_rider(visitor5)
      
      expect(carnival.most_popular).to eq(ride3)

    end
  end
end