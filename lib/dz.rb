#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-

module DZ
  class << self
    def version
      '0.1.0'
    end

    def dz2bin(s)
      hxs = s.gsub(/^#.*?$/, ' ').split(/[^0-9A-Fa-f]/)
      hxs.reject!(&:empty?)

      hxs.map { |x| x.to_i(16) }.pack('C*')
    end
  end
end
