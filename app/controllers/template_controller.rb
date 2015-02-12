class TemplateController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:render_template]

  def render_template
    @template = Template.find(params[:id])

    # If no template was found, we throw a 404
    render status: :not_found and return unless @template

    # Render the template itself
    output = @template.render(template_params)

    logger.debug output

    respond_to do |format|
      format.json do
        render json: {
                 template: {
                   output: output
                 }
               }
      end
      format.text do
        render text: @template.content
      end
    end
  end

  private

  def template_params
    params.require(:template)
  end
end
