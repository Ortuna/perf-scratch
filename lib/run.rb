require 'benchmark'
require 'pp'
require 'colorize'

def run(gc_disabled = false)
  start_mem = `ps -o rss= -p #{Process.pid}`.to_i/1024
  start_gc_count = GC.stat[:count]
  before_objects = ObjectSpace.count_objects
  GC.disable if gc_disabled
  time = Benchmark.realtime do
    yield
  end

  end_mem = `ps -o rss= -p #{Process.pid}`.to_i/1024
  end_gc_count = GC.stat[:count]
  after_objects = ObjectSpace.count_objects

  {
    execution_time: time.round(2),
    memory_usage: ("%d MB" % (end_mem - start_mem)),
    gc_count: end_gc_count - start_gc_count,
    before_objects: before_objects[:TOTAL],
    after_objects: after_objects[:TOTAL]
  }
end

def nice_print(hash)
  hash.each { |key, value| puts "#{key.to_s.red}: #{value.to_s.blue}" }   
end
