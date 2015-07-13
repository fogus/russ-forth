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

    def min
      a = @stack.pop
      b = @stack.pop
      @stack << (a < b ? a : b)
    end
  end
end
