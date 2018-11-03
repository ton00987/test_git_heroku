Given /^I am on (.*?)$/ do |page|
  visit path_to(page)
end