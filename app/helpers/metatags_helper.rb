module MetatagsHelper
  def default_meta_tags
    {
      reverse:     true,
      site:        'Git-Flow for GitHub',
      description: 'Git-Flow is a well-thought-out workflow that enables developers to work together in a streamlined way. Git-Flow for GitHub integrates it into GitHub.',
      keywords:    'git-flow,gitflow,flow,git,github,workflow',
      separator:   '&mdash;'.html_safe,
      og:          {
        title: 'Git-Flow for GitHub'
      }
    }
  end
end
