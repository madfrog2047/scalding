#!/usr/bin/env ruby

# Run it like this:
#
#   ruby codegen/function_implicits_generator.rb > src/main/scala/com/twitter/scalding/FunctionImplicits.scala

$indent = "  "

def puts_function_to_tupled(cnt)
  gen = (1 .. cnt).map{ |i| "T#{i}" }.join(", ")
  puts "#{$indent}implicit def function#{cnt}ToTupledFunction1[#{gen}, R](f: Function#{cnt}[#{gen}, R]): Function1[(#{gen}), R] = f.tupled"
end

puts "// following were autogenerated by #{__FILE__} at #{Time.now} do not edit"
puts "package com.twitter.scalding"
puts
puts"object FunctionImplicits {"
puts

(2 .. 22).each { |c|
  puts_function_to_tupled(c)
  puts
}

puts "}"
puts "// end of autogenerated"
