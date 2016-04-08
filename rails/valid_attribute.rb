# Add this file to config/initializers and have a ActiveRecord valid_attribute? method.

module ValidateAttribute
  def self.included(base)
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    def valid_attribute?(attribute_name)
      self.valid?
      self.errors[attribute_name].blank?
    end
  end
end

ActiveRecord::Base.send(:include, ValidateAttribute) if defined? ActiveRecord::Base
