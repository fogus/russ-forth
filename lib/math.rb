require 'dogestrings'

module Math
  module Arithmetic
    def plus
      @stack << (@stack.pop + @stack.pop)
    end

    def mult
      @stack << (@stack.pop * @stack.pop) 
    end
  end
end
