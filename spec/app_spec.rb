# frozen_string_literal: true

require 'stringio'
require_relative '../lib/robot'
APP_PATH = File.expand_path('../app.rb', __dir__)

RSpec.describe 'Robot CLI' do # rubocop:disable Metrics/BlockLength
  let(:robot_instance) { instance_double(Robot) }

  before do
    allow(Robot).to receive(:new).and_return(robot_instance)

    allow(robot_instance).to receive(:place)
    allow(robot_instance).to receive(:move)
    allow(robot_instance).to receive(:left)
    allow(robot_instance).to receive(:right)
    allow(robot_instance).to receive(:report)
  end

  def run_cli_with_input(input)
    $stdin = StringIO.new(input)
    $stdout = StringIO.new

    load APP_PATH

    $stdout.string
  ensure
    $stdin = STDIN
    $stdout = STDOUT
  end

  it 'welcomes the user and prints instructions' do
    output = run_cli_with_input('')

    expect(output).to include('Welcome to the Robot Simulator')
  end

  it 'calls place with correct args on valid PLACE command' do
    run_cli_with_input("PLACE 1,2,N\n")
    expect(robot_instance).to have_received(:place).with(1, 2, 'N')
  end

  it 'calls move on MOVE command' do
    run_cli_with_input("MOVE\n")
    expect(robot_instance).to have_received(:move)
  end

  it 'calls left on LEFT command' do
    run_cli_with_input("LEFT\n")
    expect(robot_instance).to have_received(:left)
  end

  it 'calls right on RIGHT command' do
    run_cli_with_input("RIGHT\n")
    expect(robot_instance).to have_received(:right)
  end

  it 'calls report on REPORT command' do
    run_cli_with_input("REPORT\n")
    expect(robot_instance).to have_received(:report)
  end

  it 'prints warning on invalid command' do
    output = run_cli_with_input("JUMP\n")
    expect(output).to include('⚠️  Invalid command: JUMP')
  end

  it 'handles multiple commands in sequence' do
    input = <<~INPUT
      PLACE 0,0,E
      MOVE
      LEFT
      REPORT
      DANCE
    INPUT

    output = run_cli_with_input(input)

    expect(robot_instance).to have_received(:place).with(0, 0, 'E')
    expect(robot_instance).to have_received(:move)
    expect(robot_instance).to have_received(:left)
    expect(robot_instance).to have_received(:report)
    expect(output).to include('⚠️  Invalid command: DANCE')
  end
end
