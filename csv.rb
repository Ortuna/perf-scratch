require_relative 'lib/run'
require 'csv'

simple = run do
  _csv = CSV.read('assets/sample.csv')
end

nice_print(simple)

line_by_line = run do
  file = CSV.open('assets/sample.csv')

  while _line = file.readline
  end

  file.close
end

nice_print(line_by_line)
