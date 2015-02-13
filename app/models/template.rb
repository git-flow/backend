class Template < ActiveRecord::Base
  belongs_to :user

  def render(data = {})
    @template = Liquid::Template.parse(content)
    @template.render(data)
  end
end
