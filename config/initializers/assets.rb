# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

# Images
Rails.application.config.assets.precompile += %w( favicon.png )
Rails.application.config.assets.precompile += %w( logo/apple-appstore.svg )
Rails.application.config.assets.precompile += %w( icon/back-button.png )
Rails.application.config.assets.precompile += %w( stock/people.jpg )
Rails.application.config.assets.precompile += %w( preview/party-info.png )

# Stylesheets
Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( flickity.css )
Rails.application.config.assets.precompile += %w( animate.css )
Rails.application.config.assets.precompile += %w( styles.css )
Rails.application.config.assets.precompile += %w( queries.css )

# Javascripts
Rails.application.config.assets.precompile += %w( flickity.pkgd.min.js )
Rails.application.config.assets.precompile += %w( waypoints.min.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.js )
Rails.application.config.assets.precompile += %w( typed.min.js )
Rails.application.config.assets.precompile += %w( scripts.js )