require 'pp'
require 'dogestrings'
require 'shufflers'

class Lexicon
  def initialize( &block )
    @entries = {}
  end
end

class Russforth
  include Verbs::Shufflers
end
