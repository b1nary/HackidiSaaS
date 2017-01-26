module ApplicationHelper
  # Make metamagic simpler by having inhertage for og and twitter tags
  def _meta options
    [:twitter, :og].each do |tag|
      options[tag] = {} if options[tag].nil?
      options[tag][:title] = options[:title]
      options[tag][:description] = options[:description]
    end

    meta options
  end

  def fa_icon icon, options = {}
    content_tag(:i, options.merge(class: "fa fa-#{icon}"))
  end
end
