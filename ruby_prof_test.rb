require 'ruby-prof'
require 'date'
require 'csv'

GC.disable
result = RubyProf.profile do
  _csv = CSV.read('./assets/sample.csv')
end

printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT, {})


exit
printer = RubyProf::GraphPrinter.new(result)
printer.print(STDOUT, {})

printer = RubyProf::GraphHtmlPrinter.new(result)
printer.print(File.open('prints/ruby_prof_test.html', "w+"), {})
