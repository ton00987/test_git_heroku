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
  rows = page.all("table#movies tbody tr td[1]").map {|t| t.text}
  table.hashes.each do |movie|
    assert rows.include? movie['title']
  end
end