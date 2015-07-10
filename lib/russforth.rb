require 'pp'
require 'dogestrings'
require 'shufflers'

class Lexicon
  def initialize( &block )
    @entries = {}
  end

  def define_word( name, &block )
    @entries[name] = { :name => name, :block => block, :immediate => false }
    self
  end

  def define_immediate_word( name, &block )
    @entries[name] = { :name => name, :block => block, :immediate => true }
    self
  end
  
end

class Russforth
  include Verbs::Shufflers
end
