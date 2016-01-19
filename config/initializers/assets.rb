# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

### Images
# Landing Page
Rails.application.config.assets.precompile += %w( favicon.png )
Rails.application.config.assets.precompile += %w( logo/apple-appstore.svg )
Rails.application.config.assets.precompile += %w( icon/back-button.png )
Rails.application.config.assets.precompile += %w( iphone-skeleton.png )
Rails.application.config.assets.precompile += %w( stock/people.jpg )
Rails.application.config.assets.precompile += %w( preview/party-info.png )
Rails.application.config.assets.precompile += %w( map-berkeley.png )

# Profile Page
Rails.application.config.assets.precompile += %w( profile/sf-background.png )
Rails.application.config.assets.precompile += %w( icon/icon-pin.png )
Rails.application.config.assets.precompile += %w( icon/icon-time.png )
Rails.application.config.assets.precompile += %w( icon/notif-bubble.png )
Rails.application.config.assets.precompile += %w( icon/new-pin.png )

### Stylesheets
# Landing Page Temporary
Rails.application.config.assets.precompile += %w( temporaryIndex.css )

# Landing Page
Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( flickity.css )
Rails.application.config.assets.precompile += %w( animate.css )
Rails.application.config.assets.precompile += %w( styles.css )
Rails.application.config.assets.precompile += %w( queries.css )
Rails.application.config.assets.precompile += %w( slick.css )
Rails.application.config.assets.precompile += %w( slick-theme.css )
Rails.application.config.assets.precompile += %w( design.css )


### Javascripts
# Landing Page
Rails.application.config.assets.precompile += %w( flickity.pkgd.min.js )
Rails.application.config.assets.precompile += %w( waypoints.min.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.js )
Rails.application.config.assets.precompile += %w( typed.min.js )
Rails.application.config.assets.precompile += %w( scripts.js )

# Profile Page
Rails.application.config.assets.precompile += %w( scripts-profile.js )
Rails.application.config.assets.precompile += %w( slick.js )