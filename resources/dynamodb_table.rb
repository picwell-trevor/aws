default_action :create
actions :create, :delete

attribute :table_name, kind_of: String, name_attribute: true
attribute :attribute_definitions, kind_of: Array, required: true
attribute :key_schema, kind_of: Array, required: true
attribute :local_secondary_indexes, kind_of: Array, default: nil
attribute :global_secondary_indexes, kind_of: Array, default: nil
attribute :provisioned_throughput, kind_of: Hash, required: true
attribute :stream_specification, kind_of: Hash, default: nil
# AWS common attributes
attribute :region, kind_of: String, default: nil
attribute :aws_access_key, kind_of: String, default: nil
attribute :aws_secret_access_key, kind_of: String, default: nil
attribute :aws_session_token, kind_of: String, default: nil

private

def self.valid_attr?(attribute_class, attribute_value)
  attr_obj = attribute_class.new(attribute_value)
  if attr_obj.is_a?(attribute_class)
    true
  else
    false
  end
rescue NameError
  false
end
