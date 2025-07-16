# spec/factories/robots.rb
FactoryBot.define do
  factory :robot do
    transient do
      x { 0 }
      y { 0 }
      direction { 'N' }
    end

    initialize_with do
      robot = new
      robot.place(x, y, direction)
      robot
    end
  end
end
