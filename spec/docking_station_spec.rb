
require './lib/docking_station.rb'
require './lib/bike.rb'

describe DockingStation do

   
     describe '#release_bike' do
      it 'responds to release bike' do
          docking_station = DockingStation.new
          expect(subject).to respond_to :release_bike
      end
     
  
      it { is_expected.to respond_to :release_bike }

      it 'releases working bikes' do
          @bikes =  [] 
          bike = subject.release_bike
          expect(bike).to be_working
      end 
  

    it { is_expected.to respond_to(:dock).with(1).argument }
    
    it { is_expected.to respond_to(:bike) }
    
    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

  it 'returns docked bikes' do
    DockingStation::DEFAULT_CAPACITY.times do
    bike = Bike.new
    subject.release_bike
    expect(subject.bike).to eq bike
    end
  end 

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'raises an error when full' do
      DockingStation::DEFAULT_CAPACITY.times do

     subject.dock Bike.new 
     expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end


  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end


  


end
end