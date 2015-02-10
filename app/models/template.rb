class Template < ActiveRecord::Base
  belongs_to :user

  def render(data = {})
    @template = Liquid::Template.parse(self.content)
    @template.render(data)
  end
end
