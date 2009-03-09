#
# Easy boolean operations.
#
# Author::    Paweł Wilk (mailto:pw@gnu.org)
# Copyright:: Copyright (c) 2009 Paweł Wilk
# License::   GNU Lesser General Public License version 3 or higher.

# This module contains helpers for evaluating logical expressions.

module MetaBool

  def is_empty?(variable=self)
    if variable.respond_to?(:empty?) && variable.respond_to?(:strip)
      variable.empty? or variable.strip.empty?
    elsif variable.respond_to? :empty?
      variable.empty?
    elsif variable.respond_to? :zero?
      variable.zero?
    else
      !variable ? true : false
    end
  end

  def is_true?(variable=self)
      r = true
      r = false           if variable.kind_of?  NilClass
      r = false           if variable.kind_of?  FalseClass  
      return r
  end

  def is_full?(variable=self);   not is_empty?(variable) end

  def is_positive?(variable=self)
      r = true
      variable = variable.length if variable.kind_of String
      r = variable > 0    if variable.kind_of?  Numeric
      r = false           if variable.kind_of?  NilClass
      r = false           if variable.kind_of?  FalseClass
      return r
  end

  def is_negative?(variable=self)
      r = false
      r = variable < 0    if variable.kind_of?  Numeric
      return r
  end

  def is_false?(variable=self);   !is_true? variable    end
  def to_b(variable=self);        is_full?  variable    end

  def have?(variable=self);       is_full? variable     end
  def have_not?(variable=self);   is_empty? variable    end
                                                  
  def do_have?(variable=self);     have? variable       end
  def have_no?(variable=self);     have_not? variable   end
  def havent?(variable=self);      have_not? variable   end
  def dont_have?(variable=self);   have_not? variable   end
  def do_not_have?(variable=self); have_not? variable   end

  def is_it?(variable=self);       is_full?  variable   end
  def is_it_not?(variable=self);   is_false? variable   end
  def isnt?(variable=self);        is_false? variable   end

  def to_class(klass_name=self)
    parts = klass_name.to_s.split(/::/)
    klass = Kernel
    parts.each do |part|
      klass = klass.const_get(part)
    end
    return klass
  end

  def class_exists?(name)
    begin
      true if name.to_class
    rescue NameError
      false
    end
  end

  def show_if_have(variable=self, message=nil)
   message = variable if message.nil?
   have?(variable) ? message : false
  end

  def show_if_is(variable=self, message=nil)
   message = variable if message.nil?
   is_it?(variable) ? message : false
  end

  def show_if_it_is(variable=self, message=nil)
    show_if_is(variable, first_txt, second_txt)
  end
  
  def if_have(message=nil)
    if block_given? && have?(self)
      yield(message.nil? ? self : message)
    else
     show_if_have(self, message)
   end
  end
 
  def if_is(message=nil)
      if block_given? && is_it?(self)
        yield(message.nil? ? self : message)
      else
       show_if_is(self, message)
     end
  end

end

def TrueClass.is_true?(x)  x != nil && x != false end
def TrueClass.is_false?(x) x != nil && x != false end


# #Warranty#
#
# This software is provided "as is" and without any express or implied warranties,
# including, without limitation, the implied warranties of merchantibility and
# fitness for a particular purpose.
