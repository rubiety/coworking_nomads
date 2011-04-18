module HtmlSelectorsHelpers
  # Maps a name to a selector. Used primarily by the
  #
  #   When /^(.+) within (.+)$/ do |step, scope|
  #
  # step definitions in web_steps.rb
  #
  def selector_for(locator)
    case locator

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
    
    # Reviews
    when "the review admin links"
      "#review-admin"
    when "the reviews list"
      "section#reviews"

    # User Accounts
    when "the user navigation"
      "#user-admin"

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #  when /the (notice|error|info) flash/
    #    ".flash.#{$1}"
    
    # You can also return an array to use a different selector
    # type, like:
    #
    #  when /the header/
    #    [:xpath, "//header"]

    # This allows you to provide a quoted selector as the scope
    # for "within" steps as was previously the default for the
    # web steps:
    when /"(.+)"/
      $1

    else
      raise "Can't find mapping from \"#{locator}\" to a selector.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(HtmlSelectorsHelpers)
