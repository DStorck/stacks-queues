require './Stack.rb'
require './Queue.rb'

waiting = Queue.new
workers = Stack.new

workers.push('one')
workers.push('two')
workers.push('three')
workers.push('four')
workers.push('five')
workers.push('six')

waiting.enqueue("seven")
waiting.enqueue("eight")
waiting.enqueue("nine")
waiting.enqueue("ten")

def roll
  rand(1..6)
end

def rehire(workers, waiting)
  num = roll
  num.times do
     fired = workers.pop
     waiting.enqueue(fired)
  end
  num.times do
    hired = waiting.dequeue
    workers.push(hired)
  end
  #i'm going to puts num here so that you i can easily see the results of the roll
  puts "#{num} was rolled."
end

rehire(workers, waiting)
puts "Current workers: #{workers.store}"
puts "On the wait list: #{waiting.store}"
rehire(workers, waiting)
puts "Current workers: #{workers.store}"
puts "On the wait list: #{waiting.store}"
