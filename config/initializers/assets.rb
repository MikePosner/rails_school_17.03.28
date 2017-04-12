# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( sessions_login.css )
Rails.application.config.assets.precompile += %w( applicants_register.css )
Rails.application.config.assets.precompile += %w( admins_show.css )
Rails.application.config.assets.precompile += %w( admins_edit.css )
Rails.application.config.assets.precompile += %w( teachers_show.css )
Rails.application.config.assets.precompile += %w( teachers_edit.css )
Rails.application.config.assets.precompile += %w( students_show.css )
Rails.application.config.assets.precompile += %w( students_edit.css )
Rails.application.config.assets.precompile += %w( rooms_edit.css )
Rails.application.config.assets.precompile += %w( admins_teachers_show.css )
