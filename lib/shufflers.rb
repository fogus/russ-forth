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

    ___ "x y z -- y z x"
    def rot 
      top = @stack.pop
      mid = @stack.pop
      lst = @stack.pop
      @stack += [mid, top, lst]
    end

    ___ "x y -- x y x"
    def over
      top = @stack.pop
      und = @stack.pop
      @stack += [und, top, und]
    end

    ___ "x -- x x"
    def qdup
      @stack << @stack.last unless @stack.last == 0 
    end
  end
end
