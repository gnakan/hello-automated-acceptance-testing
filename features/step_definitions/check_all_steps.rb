Given /^that I am a visitor to the Talk Like A Pirate Web Application$/ do

end

When(/^I visit the main app page$/) do
	visit 'http://127.0.0.1:8000' #gotta visit the page to set the content value
	#time = Time.now.to_s
	#page.save_screenshot("./screenshots/check_all_steps_screenshot-" + time +".jpg", :full => true)
end

Then(/^I should see a header$/) do
  expect(page).to have_css('.navbar-header') #checks for navbar-header class
end

Then(/^I should see valid text in the header$/) do
  expect(page).to have_css('.navbar-brand', text: 'Talk Like A Pirate') #checks for the navbar-brand class and text
end

Then(/^I should see valid h1 text in the headline$/) do
  expect(page).to have_css('h1', text: 'Abandon hope all ye that enter') #checks for specific h1 text
end

Then(/^I should see the pirate skull on the page$/) do
  expect(page).to have_css("img[src*='skull.jpeg']") #checks for an img on the page with the proper src. Does not check if img path is valid
end

Then(/^I should see a text area form field$/) do
  expect(page).to have_css("textarea") #checks for a text area form field
end

Then(/^I should see a form button with valid text$/) do
  expect(page).to have_css("button", text: 'Send it') #check for a button that has the specific text
end

Then(/^I should see a footer area$/) do
  expect(page).to have_css('footer') #checks for footer html element
end

Then(/^I should see valid text in the footer$/) do
  expect(page).to have_css('footer p', text: "TalkLikeAPirate.com") #checks for footer text in p tag
end

When(/^I enter hello in the text area$/) do
  visit 'http://127.0.0.1:8000'
  expect(page).to have_css("textarea") #checks for a text area form field
  fill_in 'originalText', :with => 'hello'
  click_button('translateBTN')
end

Then(/^I should see avast$/) do
  expect(page).to have_selector('#translatedText', :text => "avast").or  have_selector('#translatedText', :text => "ahoy")#this approach is used to avoid potential timing issues
  time = Time.now.to_s
  page.save_screenshot("./screenshots/check_all_steps_screenshot-" + time +".jpg", :full => true)
end

When(/^I enter walk the plank in the text area$/) do
  visit 'http://127.0.0.1:8000'
  expect(page).to have_css("textarea") #checks for a text area form field
  fill_in 'originalText', :with => 'walk the plank'
  click_button('translateBTN')
end

Then(/^I should see walk yonder plank or walk ye plank$/) do
  expect(page).to have_selector('#translatedText', :text => "walk yonder plank").or have_selector('#translatedText', :text => "walk ye plank")#example of compound expectation
  time = Time.now.to_s
  page.save_screenshot("./screenshots/check_all_steps_screenshot-" + time +".jpg", :full => true)
end
