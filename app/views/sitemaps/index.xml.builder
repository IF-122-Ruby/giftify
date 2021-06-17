xml.instruct! :xml, :version => "1.0"
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/9.0" do
  xml.url do
    xml.loc root_url
    xml.lastmod Time.now.to_date
    xml.changefreq "never"
    xml.priority "1"
  end

  xml.url do
    xml.loc about_url
    xml.lastmod Time.now.to_date
    xml.changefreq "yearly"
    xml.priority "0.9"
  end

  xml.url do
    xml.loc pricing_url
    xml.lastmod Time.now.to_date
    xml.changefreq "yearly"
    xml.priority "0.8"
  end

  xml.url do
    xml.loc feedback_url
    xml.lastmod Time.now.to_date
    xml.changefreq "yearly"
    xml.priority "0.8"
  end

  @posts.each do |post|
    xml.url do
      xml.loc post_url(post.id)
      xml.lastmod post.updated_at.to_date
      xml.changefreq "always"
      xml.priority "0.7"
    end
  end
end
