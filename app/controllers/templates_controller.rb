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

    flash[:edit_template] = t('template.edit.success')
    redirect_to edit_template_path
  end

  def render_template
    @template = Template.find(params[:id])

    return render status: :not_found unless @template

    begin
      @result = @template.render(params[:data])

      render json: { template: { result: @result } }
    rescue Liquid::SyntaxError => syntax_error
      render json: { errors: [syntax_error.message] }
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
