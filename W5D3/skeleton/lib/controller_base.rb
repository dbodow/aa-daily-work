require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'erb'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, params={})
    @req = req
    @res = res
    @params = params.merge(req.params)
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    !!@already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "Multiple responses detected" if already_built_response?
    @already_built_response = true
    session.store_session(@res)
    @res['Location'] = url
    @res.status = 302
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "Multiple responses detected" if already_built_response?
    @already_built_response = true
    session.store_session(@res)
    @res['Content-Type'] = content_type
    @res.write(content)
  end

  # "views/#{controller_name}/#{template_name}.html.erb". Use ActiveSupport's
  # #underscore (require 'active_support/inflector') method to convert the controller's
  # class name to snake case.

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    controller_name = self.class.to_s.underscore
    template_path = "views/#{controller_name}/#{template_name}.html.erb"

    render_file = File.read(template_path)
    render_erb = ERB.new(render_file)
    render_string = render_erb.result(binding)
    render_content(render_string, 'text/html')
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    self.send(name)
    render(name) unless @already_built_response
  end
end
