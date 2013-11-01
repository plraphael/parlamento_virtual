class EmblemPreprocessor < Sprockets::Processor
  def evaluate(context, locals)
    "<fabs>"+data+"</fabs>"
  end
end

# in config/initializers/sprockets.rb
Rails.application.assets.register_preprocessor('.emblem',EmblemPreprocessor)