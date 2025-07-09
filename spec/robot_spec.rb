# frozen_string_literal: true

require_relative '../lib/robot'

RSpec.describe Robot do # rubocop:disable Metrics/BlockLength
  let(:robot) { Robot.new }

  describe '#place' do
    it 'places the robot correctly with valid coordinates and direction' do
      robot.place(1, 2, 'N')
      expect { robot.report }.to output("1,2,N\n").to_stdout
    end

    it 'ignores invalid direction' do
      robot.place(0, 0, 'INVALID')
      expect { robot.report }.not_to output.to_stdout
    end

    it 'ignores out-of-bounds positions' do
      robot.place(6, 6, 'N')
      expect { robot.report }.not_to output.to_stdout
    end
  end

  describe '#move' do
    it 'moves north when possible' do
      robot.place(2, 2, 'N')
      robot.move
      expect { robot.report }.to output("2,3,N\n").to_stdout
    end

    it 'does not move north beyond the grid' do
      robot.place(0, 5, 'N')
      robot.move
      expect { robot.report }.to output("0,5,N\n").to_stdout
    end

    it 'moves east when possible' do
      robot.place(2, 2, 'E')
      robot.move
      expect { robot.report }.to output("3,2,E\n").to_stdout
    end

    it 'does not move west beyond the grid' do
      robot.place(0, 0, 'W')
      robot.move
      expect { robot.report }.to output("0,0,W\n").to_stdout
    end

    it 'ignores move before PLACE' do
      robot.move
      expect { robot.report }.not_to output.to_stdout
    end
  end

  describe '#left' do
    it 'rotates left from N to W' do
      robot.place(1, 1, 'N')
      robot.left
      expect { robot.report }.to output("1,1,W\n").to_stdout
    end

    it 'rotates left from E to N' do
      robot.place(1, 1, 'E')
      robot.left
      expect { robot.report }.to output("1,1,N\n").to_stdout
    end

    it 'ignores left before PLACE' do
      robot.left
      expect { robot.report }.not_to output.to_stdout
    end
  end

  describe '#right' do
    it 'rotates right from N to E' do
      robot.place(1, 1, 'N')
      robot.right
      expect { robot.report }.to output("1,1,E\n").to_stdout
    end

    it 'rotates right from W to N' do
      robot.place(1, 1, 'W')
      robot.right
      expect { robot.report }.to output("1,1,N\n").to_stdout
    end

    it 'ignores right before PLACE' do
      robot.right
      expect { robot.report }.not_to output.to_stdout
    end
  end

  describe '#report' do
    it 'prints current position and direction' do
      robot.place(3, 3, 'S')
      expect { robot.report }.to output("3,3,S\n").to_stdout
    end

    it 'does nothing before PLACE' do
      expect { robot.report }.not_to output.to_stdout
    end
  end
end
