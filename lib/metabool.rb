#
# Easy boolean operations.
#
# Author::    Paweł Wilk (mailto:pw@gnu.org)
# Copyright:: Copyright (c) 2009 Paweł Wilk
# License::   GNU Lesser General Public License version 3 or higher.

# This module contains helpers for evaluating logical expressions.

module MetaBool
  # :stopdoc:
  VERSION_CODE = '000005'.freeze
  VERSION = VERSION_CODE.scan(/../).collect{|n| n.to_i}.join('.').freeze
  # :startdoc:
end

require 'metabool/main.rb'

# #Warranty#
#
# This software is provided "as is" and without any express or implied warranties,
# including, without limitation, the implied warranties of merchantibility and
# fitness for a particular purpose.
