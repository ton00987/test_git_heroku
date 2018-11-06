Given ("the following movies exist:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |movie|
        Movie.create(movie)
    end
end

Then /^I should see (none|all) of the movies$/ do |should|
    rows = page.all("table#movies tbody tr td[1]").map {|t| t.text}
    if should == "none"
      assert rows.size == 0
    else
      assert rows.size == Movie.all.count
    end
end

And("I should see following movies:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  rows = page.all("table#movies tbody tr td[1]").map {|t| t.text.titleize}
  table.hashes.each do |movie|
    assert rows.include? movie["title"].titleize
  end
end

When("I fill in {string} with {string}") do |string, string2|
  fill_in string, with: string2
end

When("I select {string} from {string}") do |string, string2|
  select string, :from => string2
end

When("I press {string}") do |string|
  click_button string
end

Then("I should see {string}") do |string|
  page.has_content?(string)
end

Then("I should see {string} with rating {string}") do |movie, rating|
  rows = page.all("table#movies tbody tr td[1]").map {|t| t.text.titleize}
  rows = rows.find_index(movie)
  assert page.all("table#movies tbody tr[#{rows+1}] td[2]").map {|t| t.text.titleize}[0] == rating
end