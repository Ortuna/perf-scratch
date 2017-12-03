require_relative 'lib/run'

other = run do
  data = Array.new(1_000) { 'X' * 1024 * 1024 }
  data = nil

  GC.start
end

puts "********* OTHER *********"
nice_print(other)

data = Array.new(1000) { 'X' * 1024 * 1024 } # 1 MB each
metrics_simple = run do
  data.map { |item| item.upcase }
end
puts "********* SIMPLE *********"
nice_print(metrics_simple)





data = Array.new(1000) { 'X' * 1024 * 1024 }
metrics_opt = run do
  data.map! { |item| item.upcase! }
end
puts "********* FIXED  *********"
nice_print(metrics_opt)


