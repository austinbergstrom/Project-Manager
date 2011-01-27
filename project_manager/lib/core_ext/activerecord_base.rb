module ActiveRecordBase
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def create_object(attributes)
      id = attributes[:id]
      begin
        object = find(id)
        object.update_attributes(attributes)
        return object
      rescue
        new_object = new
        new_object.id = id
        success = new_object.update_attributes!(attributes)
        if !success
          puts "ERROR CREATING OBJECT #{id.to_s}"
        end
        return new_object
      end
    end
  end
end

class ActiveRecord::Base
  include ActiveRecordBase
end