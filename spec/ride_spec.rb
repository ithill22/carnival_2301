require 'spec_helper'

RSpec.describe Ride do
  let(:ride1) {Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })}
  let(:ride2) {Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })}
  let(:ride3) {Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })}
  let(:visitor1) {Visitor.new('Bruce', 54, '$10')}
  let(:visitor2) {Visitor.new('Tucker', 36, '$5')}
  let(:visitor3) {Visitor.new('Penny', 64, '$15')}

  describe "#initialize" do
    it 'can initialize' do
      expect(ride1).to be_instance_of(Ride)
     expect(ride1.name).to eq('Carousel')
      expect(ride1.min_height).to eq(24)
      expect(ride1.admission_fee).to eq(1)
      expect(ride1.excitement).to eq(:gentle)
      expect(ride1.total_revenue).to eq(0)
    end
  end

  describe '#board_rider' do
    it 'can add a visitor to the rider_log in the form of a hash' do
      expect(ride1.rider_log).to eq({})

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)

      expect(ride1.rider_log).to eq({vistor1, visitor2})
    end

    it 'can include the rider preference when added' do
      expect(ride1.rider_log).to eq({})

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)

      expect(ride1.rider_log).to eq({vistor1, visitor2})
    end
  end

end