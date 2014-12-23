module MetatagsHelper
  def default_meta_tags
    {
      reverse:     true,
      site:        t('site.name'),
      description: t('site.description'),
      keywords:    t('site.keywords'),
      separator:   '&mdash;'.html_safe,
      og:          {
        title: t('site.name')
      }
    }
  end
end
