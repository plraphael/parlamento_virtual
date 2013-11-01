module ApplicationHelper
  def emblem_template(template)
    render file: "emblem/_x_emblem.html.erb", locals: {name: template}
  end
end
