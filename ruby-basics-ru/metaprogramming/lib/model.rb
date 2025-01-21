# frozen_string_literal: true

# BEGIN

module Model

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def attribute(name, options = {})

      type = options[:type]

      define_method(name) do
        if type.nil? || instance_variable_get("@#{name}").nil?
          instance_variable_get("@#{name}")
        else
          if type == :integer
            instance_variable_get("@#{name}").to_i
          elsif type == :string
            instance_variable_get("@#{name}").to_s
          elsif type == :datetime
            DateTime.parse(instance_variable_get("@#{name}").to_s)
          elsif type == :boolean
            instance_variable_get("@#{name}") ? true : false
          end
        end
      end

      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end
    end
  end

  def initialize(attributes = {})
    attributes.each do |name, value|
      public_send("#{name}=", value) if respond_to?("#{name}=")
    end
  end

  def attributes
    attrs = instance_variables.map{ |var| var.to_s.delete('@')}.to_a
    result = {}
    attrs.each do |attr|
      result[attr.to_sym] = self.send(attr.to_sym)
    end
    result
  end

end

# END
