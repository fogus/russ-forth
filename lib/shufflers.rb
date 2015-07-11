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
      a = @stack.pop
      b = @stack.pop
      c = @stack.pop
      @stack << b << a << c      
    end

    ___ "x -- x x"
    def qdup
      @stack << @stack.last unless @stack.last == 0 
    end
  end
end
