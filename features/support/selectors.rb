module HtmlSelectorsHelper
  def selector_for(scope)
    case scope
      
    # Generic Mappings:
    when "the body"
      "html > body"
    when "the first row of the table"
      "table.data tbody tr:first"
    when "the header links"
      "header#header nav"
    when "the flash messages"
      "#flash"

    # Cities
    when "the city admin links"
      "#city-admin"
    when "the cities list"
      "section#cities"

    # Venues
    when "the venue admin links"
      "#venue-admin"
    when "the venues list"
      "section#venues"
    
    else
      raise "Can't find mapping from \"#{scope}\" to a selector.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(HtmlSelectorsHelper)
