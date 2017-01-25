module ApplicationHelper
  # Make metamagic simpler by having inhertage for og and twitter tags
  def _meta options
    options[:twitter] = {} if options[:twitter].nil?
    options[:twitter][:title] = options[:title] if options[:twitter][:title].nil?
    options[:twitter][:description] = options[:description] if options[:twitter][:description].nil? && !options[:description].nil?

    options[:og] = {} if options[:og].nil?
    options[:og][:title] = options[:title] if options[:og][:title].nil?
    options[:og][:description] = options[:description] if options[:og][:description].nil? && !options[:description].nil?

    meta options
  end
end
