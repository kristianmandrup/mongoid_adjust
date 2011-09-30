require 'mongoid'

module Mongoid::Extensions::Array
  module Mutators
    def adjust!(attrs = {})
      attrs.each_pair do |key, value|
        self.each do |doc|
          doc.adjust!(attrs)
        end
      end
      self
    end
  end
end

module Mongoid
  class Criteria
    def adjust!(attrs = {})
      to_a.adjust!(attrs)
    end
  end
end

module Mongoid::Document

  def has_key? key
    @attributes[key.to_s] || respond_to?("#{key}=")
  end

  def adjust!(attrs = {})
    (attrs || {}).each_pair do |key, value|
      next if !has_key? key # only add to properties already present!
      adjust_by_proc!(key, value) if value.kind_of?(Proc)
      adjust_by_symbol!(key, value) if value.kind_of?(Symbol) || value.kind_of?(String)
      adjust_by_number!(key, value) if value.kind_of?(Numeric) # only add integer values
    end
    self
  end

  private

  def adjust_by_proc! key, proc
    current_val = @attributes[key.to_s]
    self.update_attributes key.to_s => proc.call(current_val)
  end

  def adjust_by_symbol! key, name
    method = name.to_sym
    current_val = @attributes[key.to_s]
    self.update_attributes key.to_s => current_val.send(method)
  end

  def adjust_by_number! key, value
    current_val = @attributes[key.to_s] || 0

    if current_val.kind_of? Numeric
      self.update_attributes key.to_s => current_val + value
    end
  end
end

class Array
  include Mongoid::Extensions::Array::Mutators
end

class NilClass
  def integer?
    false
  end
end
