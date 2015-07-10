require 'dogestrings'

module Verbs
  module Shufflers
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

    ___ "x -- x x"
    def q_dup
      @stack << @stack.last unless @stack.last == 0 
    end
  end
end
