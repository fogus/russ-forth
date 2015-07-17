require 'dogestrings'

module Verbs
  module Comparators
    def eq
      a = @stack.pop
      b = @stack.pop

      @stack << (a == b)
    end

    def gt
      rhs = @stack.pop
      lhs = @stack.pop

      @stack << (lhs > rhs)
    end

    def lt
      rhs = @stack.pop
      lhs = @stack.pop

      @stack << (lhs < rhs)
    end
  end
end
