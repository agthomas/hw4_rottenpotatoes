# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

Then /the director of "(.*)" should be "(.*)"/ do |title_name,director_name|

end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|

  regexp = /#{e1}.*#{e2}/m
  page.body.should =~ regexp

end


When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(", ").each do |rating|
      step %Q{I #{uncheck}check "ratings_#{rating}"}
  end
end

When /^i follow "([^"]*)"$/ do |arg1|
    step %Q{I follow "#{arg1}"}
end

Then /^I should see all of the movies$/ do
#  page.all('table#movies tbody#movielist tr').count.should == Movie.all.size
  page.all('table#movies tbody tr').count.should == Movie.all.size

end

Then /^I should see no movies$/ do
  page.all('table#movies tbody#movielist tr').count.should == 0
end
