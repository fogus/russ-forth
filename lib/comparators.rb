require 'dogestrings'

module Verbs
  module Comparators
    def eq
      a = @stack.pop
      b = @stack.pop

      @stack << (a == b)
    end
  end
end
