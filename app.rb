# frozen_string_literal: true

require_relative 'lib/robot'

robot = Robot.new

puts 'Welcome to the Robot Simulator'
puts 'Enter commands (PLACE X,Y,DIRECTION | MOVE | LEFT | RIGHT | REPORT)'
puts 'Press Ctrl+D to exit.'

while (line = $stdin.gets)
  command = line.strip

  if command =~ /^PLACE\s+(\d+),(\d+),(N|E|S|W)$/
    x = Regexp.last_match(1).to_i
    y = Regexp.last_match(2).to_i
    dir = Regexp.last_match(3)
    robot.place(x, y, dir)
  elsif %w[MOVE LEFT RIGHT REPORT].include?(command)
    case command
    when 'MOVE'   then robot.move
    when 'LEFT'   then robot.left
    when 'RIGHT'  then robot.right
    when 'REPORT' then robot.report
    end
  else
    puts "⚠️  Invalid command: #{command}"
  end
end
