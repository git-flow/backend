class TemplateController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:render_template]

  respond_to :json
  def new
    @template = Template.new
  end

  respond_to :json, :html
  def create
    @template = Template.new(create_template_params)
    @template.user = current_user
    @template.save

    respond_with @template
  end

  def render_template
    @template = Template.find(params[:id])

    # If no template was found, we throw a 404
    return render status: :not_found unless @template

    # Render the template itself
    output = @template.render(render_template_params)

    respond_with({ template: { output: output } },
                 location: template_path(params[:id]))
  end

  private

  def render_template_params
    params.require(:template)
  end

  def create_template_params
    params.require(:template).permit(:name, :content)
  end
end
