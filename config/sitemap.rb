# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://xxx.com'
SitemapGenerator::Sitemap.sitemaps_host = 'https://s3-ap-northeast-1.amazonaws.com/xxx'
SitemapGenerator::Sitemap.public_path = 'public/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new
SitemapGenerator::Sitemap.create_index = true
SitemapGenerator::Sitemap.namer = SitemapGenerator::SimpleNamer.new(:sitemap, :zero => '_index')

SitemapGenerator::Sitemap.create do
  # TODO
end
