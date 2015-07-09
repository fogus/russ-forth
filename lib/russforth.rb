require 'pp'
require 'dogestrings'

module Verbs
  ___ "x -- "
  def drop
    @stack.pop
  end

  ___ "x -- x x"
  def dup
    @stack << @stack.last
  end

  ___ "x y -- y x"
  def swap
    @stack += [@stack.pop, @stack.pop]
  end
end

module Adverbs
end

class Russforth
  
end
