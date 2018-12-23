Figaro.require_keys("forest_auth_secret", "forest_env_secret")
# ForestLiana.env_secret = Rails.application.secrets.forest_env_secret
ForestLiana.env_secret = Figaro.env.forest_env_secret
# ForestLiana.auth_secret = Rails.application.secrets.forest_auth_secret
ForestLiana.auth_secret = Figaro.env.forest_auth_secret
# ForestLiana.auth_secret = Rails.application.application.forest_auth_secret
