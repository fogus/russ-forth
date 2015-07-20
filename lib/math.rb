require 'dogestrings'

module Math
  module Arithmetic
    def plus
      @stack << (@stack.pop + @stack.pop)
    end

    def mult
      @stack << (@stack.pop * @stack.pop) 
    end

    def subtract
      a = @stack.pop
      b = @stack.pop
      @stack << b - a
    end

    def divide
      a = @stack.pop
      b = @stack.pop
      @stack << b / a
    end

    def abs
      @stack << (@stack.pop.abs) 
    end

    def min
      a = @stack.pop
      b = @stack.pop
      @stack << (a <= b ? a : b)
    end

    def max
      a = @stack.pop
      b = @stack.pop
      @stack << (a <= b ? b : a)
    end
  end
end
