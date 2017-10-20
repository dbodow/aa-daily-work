class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    names.each do |name|
      AttrAccessorObject.make_attr_reader(name)
      AttrAccessorObject.make_attr_writer(name)
    end
  end

  # prepend_at: string => symbol
  def self.prepend_at(symbol)
    ('@' + symbol.to_s).to_sym
  end

  # append_equals: string => symbol
  def self.append_equals(symbol)
    (symbol.to_s + '=').to_sym
  end

  def self.make_attr_reader(name)
    define_method(name.to_sym) do
      instance_variable_get(AttrAccessorObject.prepend_at(name))
    end
  end

  def self.make_attr_writer(name)
    define_method(append_equals(name)) do |arg=nil|
      instance_variable_set(AttrAccessorObject.prepend_at(name), arg)
    end
  end

  # private_class_method :prepend_at, :append_equals, :make_attr_writer, :make_attr_reader
end
