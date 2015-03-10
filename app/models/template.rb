class Template < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, length: { in: 3..255 }
  validates :content, presence: true

  def render(data = {})
    @template = Liquid::Template.parse(content)
    @template.render(data)
  end
end
