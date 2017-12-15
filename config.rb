# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

Time.zone = 'Asia/Tokyo'

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'
# 別レイアウトを一括指定
page '/custom_layout/*', layout: 'custom_layout'
page '/blog/*', layout: 'blog'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.prefix = "blog/articles"

  blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  blog.sources = "{year}/{month}/{day}-{title}.html"
  blog.taglink = "tags/{tag}.html"
  blog.layout = "layouts/blog"
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  blog.year_link = "{year}.html"
  blog.month_link = "{year}/{month}.html"
  blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md"

  blog.tag_template = "/blog/tag.html"
  blog.calendar_template = "/blog/calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"

  # blog.custom_collections = {
  #   category: {
  #     link: "/{category}.html",
  #     template: "/category.html"
  #   }
  # }
end

# markdown settings
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true, :with_toc_data => true, :tables => true, :autolink => true, :gh_blockcode => true

# syntax highlight


page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end


# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

activate :livereload

# Build-specific configuration
configure :build do
  activate :minify_html
  activate :minify_css
  activate :minify_javascript

  # リポジトリ名を host に設定しておく
  # こうすることで stylesheet_link_tag などで展開されるパスが
  # /test-middleman/stylesheets/normalize.css
  # のようになる
  # activate :asset_host, :host => "/your_repository_name"
  # これは必要か不明
  # set :relative_links, true
end


# デプロイの設定
# 今回は gh-pages を使用するので branch に 'gh-pages' を設定する
# activate :deploy do |deploy|
#   deploy.build_before = true
#   deploy.deploy_method = :git
#   deploy.branch = 'gh-pages'
# end
