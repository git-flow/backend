class TemplatesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:render_template]
  respond_to :json, :html

  def index
    @templates = Template.all
  end

  def new
    @template = Template.new
  end

  def create
    @template = Template.new(create_template_params)
    @template.user_id = current_user.id
    @template.save

    respond_with @template, location: edit_template_path(@template)
  end

  def edit
    @template = Template.find(params[:id])
  end

  def update
    @template = Template.find(params[:id])
    @template.update(update_template_params)
  end

  def render_template
    @template = Template.find(params[:id])

    # If no template was found, we throw a 404
    return render status: :not_found unless @template

    begin
      # Render the template itself
      @result = @template.render(params[:data])
      @result.lstrip!

      render json: { template: { result: @result } }
    rescue Liquid::SyntaxError => syntax_error
      respond_with do |format|
        format.html { render text: syntax_error.message, status: :unprocessable_entity }
        format.json { render json: { errors: [syntax_error.message] } }
      end
    end
  end

  private

  def update_template_params
    params.require(:template).permit(:name, :content)
  end

  def create_template_params
    params.require(:template).permit(:name, :content)
  end
end
