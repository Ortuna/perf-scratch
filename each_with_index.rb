require_relative 'lib/run'

before = ObjectSpace.count_objects

run do
  Array.new(100_000) {
    [1,0].each_with_index { |j,i| }
  }
end

after = ObjectSpace.count_objects

pp before
pp after


