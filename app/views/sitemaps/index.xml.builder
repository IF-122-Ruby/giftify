xml.instruct! :xml, :version => "1.0"
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/9.0" do
  xml.url do
    xml.loc @url
    xml.lastmod Time.now.to_date
    xml.changefreq "never"
    xml.priority "1"
  end

  xml.url do
    xml.loc @url + "/about"
    xml.lastmod Time.now.to_date
    xml.changefreq "yearly"
    xml.priority "0.9"
  end

  xml.url do
    xml.loc @url + "/pricing"
    xml.lastmod Time.now.to_date
    xml.changefreq "yearly"
    xml.priority "0.8"
  end

  xml.url do
    xml.loc @url + "/contact_us"
    xml.lastmod Time.now.to_date
    xml.changefreq "yearly"
    xml.priority "0.8"
  end

  for id,updated_at in @posts do
    xml.url do
      xml.loc @url + posts_path(id)
      xml.lastmod updated_at.to_date
      xml.changefreq "always"
      xml.priority "0.7"
    end
  end
end
