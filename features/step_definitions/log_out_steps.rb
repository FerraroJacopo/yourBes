

Given("I am an authenticated user") do
    @user=create(:user)
    visit new_user_session_path
    fill_in "Email", :with => @user.email
    fill_in "Password", :with => @user.password
    click_button "Log in"
end

Given("I am on the home page") do
    page.has_content?("User: "+@user.username)
end

When /I click on "Esci"/ do
    click_on("Esci")
end

Then("I should be not authenticated") do
    page.has_content?("Log in")
end