require_relative 'lib/run'
require 'date'

date = '2000-02-01'
metrics = run do
  100_000.times do
    Date.parse(date)
  end
end

nice_print metrics

puts '#' * 80

date = '2000-02-01'
metrics = run do
  100_000.times do
    date.class
  end
end

nice_print metrics


