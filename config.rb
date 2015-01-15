require 'lib/helpers'

set :source,       'src'
set :build_dir,    'dist'
set :css_dir,      'assets/css'
set :js_dir,       'assets/js'
set :images_dir,   'assets/img'
set :fonts_dir,    'assets/fonts'
set :layouts_dir,  '_templates/layouts'
set :partials_dir, '_templates/partials'

set :layout, 'default'

set :markdown_engine, :redcarpet
set :haml, { format: :html5 }
set :markdown, fenced_code_blocks: true

activate :automatic_image_sizes
activate :automatic_alt_tags

helpers CustomHelpers

configure :development do
    set :debug_assets, true
end

configure :build do
    activate :minify_css
    activate :minify_javascript
    activate :asset_hash
    activate :relative_assets
end
