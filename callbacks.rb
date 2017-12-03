require_relative 'lib/run'
require 'csv'


class CallbackHolder
  attr_reader :callbacks

  def initialize
    @callbacks = []
  end

  def save_callback(&callback)
    callbacks << callback
  end

  def execute
    callbacks.each { |callback| callback.call }
  end

end
callback_metrics = run do
  holder = CallbackHolder.new

  1_000_000.times do |index|
    holder.save_callback { "At callback #{index}" }
  end

  holder.execute
end

nice_print(callback_metrics)
