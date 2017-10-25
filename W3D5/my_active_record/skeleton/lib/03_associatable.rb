require 'byebug'
require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    @class_name.singularize.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    # ...
    @primary_key = options[:primary_key] || :id
    @foreign_key = options[:foreign_key] || (name.underscore + '_id').to_sym
    @class_name = options[:class_name] || name.capitalize
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    # ...
    @primary_key = options[:primary_key] || :id
    @foreign_key = options[:foreign_key] || (self_class_name.underscore + '_id').to_sym
    @class_name = options[:class_name] || name.capitalize.singularize
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    # ...
    define_method(name) do

      belongs_to_options = BelongsToOptions.new(name.to_s, options)
      foreign_key = belongs_to_options.foreign_key
      model_class = belongs_to_options.model_class
      primary_key = belongs_to_options.primary_key
      model_class.where(primary_key => send(foreign_key)).first

    end
    @assoc_options = options
  end

  def has_many(name, options = {})
    # ...
    define_method(name) do

      has_many_options = HasManyOptions.new(name.to_s, self.class.to_s, options)
      foreign_key = has_many_options.foreign_key
      model_class = has_many_options.model_class
      primary_key = has_many_options.primary_key
      model_class.where(foreign_key => send(primary_key))

    end
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
    @assoc_options ||= {}
  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
end
