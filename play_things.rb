# class Stats
#   attr_accessor :order
#   @counter = 0

#   def initialize
#     @counter = 0
#   end

#   def self.increment
#     @counter += 1
#   end

#   def self.value
#     @counter
#   end

#   def increment
#     @counter += 1
#   end

#   def value
#     @counter
#   end
# end


# st = Stats.new
# Stats.increment
# st.increment

# puts Stats.value
# puts st.value

# Stats.increment
# st.increment

# puts Stats.value
# st.order = 'Ayo'
# puts st.order

# log_folder = File.join(__dir__, 'tmp')
# log_filename = 'app.log'
# log_path = File.join(log_folder, log_filename)

# File.foreach(log_path) do |line|
#   puts line
# end

# File.open(log_path, 'a') do |content|
#   content.puts 'Hello'
# end

# puts File.open(log_path)

# puts $stdin
# puts STDIN