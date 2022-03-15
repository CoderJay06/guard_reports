# frozen_string_literal: true

require './config/environment'

set :database, "postgres://localhost/development"

# raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.' if ActiveRecord::Migrator.needs_migration?

use Rack::MethodOverride
run ApplicationController
use GuardsController
use ReportsController
