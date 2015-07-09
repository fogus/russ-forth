require 'pp'
require 'dogestrings'

module Verbs
  def dup
    @stack << @stack.last
  end
end

module Adverbs
end

class Russforth
  
end
