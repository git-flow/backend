class TemplateController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:render_template]

  respond_to :json

  def render_template
    @template = Template.find(params[:id])

    # If no template was found, we throw a 404
    render status: :not_found and return unless @template

    # Render the template itself
    output = @template.render(template_params)

    respond_with({ template: { output: output } },
                 location: template_path(params[:id]))
  end

  private

  def template_params
    params.require(:template)
  end
end
