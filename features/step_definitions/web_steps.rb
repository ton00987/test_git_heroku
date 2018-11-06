Given /^I am on (.*?)$/ do |page|
  visit path_to(page)
end

When("I follow {string}") do |string|
  click_link(string)
end

Then("I on the {string} detail page") do |title|
    current_path = URI.parse(current_url).path
    assert current_path =~ /^\/movies\/(\d+)$/
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end