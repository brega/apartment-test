# Require whichever elevator you're using below here...
#
# require 'apartment/elevators/generic'
# require 'apartment/elevators/domain'
# require 'apartment/elevators/subdomain'
require 'tenant'

#
# Apartment Configuration
#
Apartment.configure do |config|

  # These models will not be multi-tenanted,
  # but remain in the global (public) namespace
  #
  # An example might be a Customer or Tenant model that stores each tenant information
  # ex:
  #
  # config.excluded_models = %w{Tenant}
  #
  config.excluded_models = %w{}

  # use postgres schemas?
  config.use_schemas = true

  # use raw SQL dumps for creating postgres schemas? (only appies with use_schemas set to true)
  config.use_sql = false

  # configure persistent schemas (E.g. hstore )
  config.persistent_schemas = %w{ public }

  # add the Rails environment to database names?
  # config.prepend_environment = true
  # config.append_environment = true

  # supply list of database names for migrations to run on
  config.tenant_names = lambda{ Tenant::TENANTS }
  config.default_schema = 'lx_default'

  config.seed_after_create = false
end

##
# Elevator Configuration

# Rails.application.config.middleware.use 'Apartment::Elevators::Generic', lambda { |request|
# }
# Rails.application.config.middleware.use 'Apartment::Elevators::Domain'
# Rails.application.config.middleware.use 'Apartment::Elevators::Subdomain'



