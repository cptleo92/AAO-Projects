require_relative '02_searchable'
require 'byebug'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    self.class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    self.foreign_key = options[:foreign_key] || "#{name.to_s}_id".to_sym
    self.primary_key = options[:primary_key] || :id
    self.class_name = options[:class_name] || name.to_s.capitalize.singularize
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    self.foreign_key = options[:foreign_key] || "#{self_class_name.downcase.to_s}_id".to_sym
    self.primary_key = options[:primary_key] || :id
    self.class_name = options[:class_name] || name.to_s.capitalize.singularize
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    self.assoc_options[name] = BelongsToOptions.new(name, options)
    
    define_method(name) {      
      options = self.class.assoc_options[name]
      f_key = self.send(options.foreign_key)
      model = options.model_class
      model.where(id: f_key).first      
    }    
  end

  def has_many(name, options = {})
    self_class_name = self.to_s.downcase
    options = HasManyOptions.new(name, self_class_name, options)
      
    define_method(name) {      
      # byebug    
      f_key = options.foreign_key
      options.model_class.where(f_key => self.id )
    }    
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
    @assoc_options ||= {}
    @assoc_options
  end
end

class SQLObject
  extend Associatable
end
