# Load the Rails application.
require_relative 'application'
DEFAULT_META = YAML.load_file(Rails.root.join('config/meta.yml'))
# Initialize the Rails application.
Rails.application.initialize!
