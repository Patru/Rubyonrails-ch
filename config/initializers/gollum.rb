require 'gollum/frontend/app'

Precious::App.set(:gollum_path, Rails.root.join('app', 'data.git'))
Precious::App.set(:wiki_options, {})

