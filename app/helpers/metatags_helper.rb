module MetatagsHelper
  def default_meta_tags
    {
      reverse:     true,
      site:        t('site.name'),
      description: t('site.description'),
      keywords:    t('site.keywords'),
      separator:   '&mdash;'.html_safe,
      og: default_og_tags
    }
  end

  def default_og_tags
    {
      title: title,
      description: t('site.description'),
      site_name: t('site.name'),
      image: image_url('site/facebook_og.png'),
      type: 'website',
      url: url_for(only_path: false)
    }
  end
end
