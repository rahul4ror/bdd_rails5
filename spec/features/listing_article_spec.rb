require "rails_helper"

RSpec.feature "Listing Article" do
  
  before do
    @article1 = Article.create(title: "First Article", body: "Loren Epsum")
    @article2 = Article.create(title: "Second Article", body: "Body of second Article")
  end

  scenario "A user list all article" do
    visit '/'

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)

  end

  scenario 'A user has no article' do
    Article.delete_all

    visit '/'
    expect(page).not_to have_content(@article1.title)
    expect(page).not_to have_content(@article1.body)
    expect(page).not_to have_content(@article2.title)
    expect(page).not_to have_content(@article2.body)
    expect(page).not_to have_link(@article1.title)
    expect(page).not_to have_link(@article2.title)

    within ("h1#no-article") do
      expect(page).to have_content("No Article Created")
    end
  end  
end