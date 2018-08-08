require "rbcrypto/version"
require 'thor'
require 'bitcoin'
require 'eth'

module Rbcrypto
  # Your code goes here...
  class Test < Thor

    desc "hello [there]", "my first api console"
    def hello(there)
      puts "ok!!! desu #{there}"
    end

    desc "validate [address] --eth(-e) \n validate [address] --btc(-b)", "validate address eth/btc"
    method_option :eth, aliases: %w'-e -ee', type: :boolean
    method_option :btc, aliases: '-b', type: :boolean
    def validate_eth(address)
      if options.eth?
        puts Eth::Utils.valid_address?(address)
      else
        puts Bitcoin.valid_address?(address)
      end
    end
  end
end
