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
  end
end
