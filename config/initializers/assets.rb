# be sure to restart your server when you modify this file.

# version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# add additional assets to the asset load path.
# rails.application.config.assets.paths << emoji.images_path
# add yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( question.js modals.js application.js )

# precompile additional assets.
# application.js, application.css, and all non-js/css in the app/assets
# folder are already added.
# rails.application.config.assets.precompile += %w( admin.js admin.css )
