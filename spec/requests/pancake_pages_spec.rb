require 'spec_helper'

describe "Pancake pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Welcome to My Pancake' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Index') }
  end

  describe "Blog page" do
    before { visit blog_path }

    let(:heading)    { 'Blog' }
    let(:page_title) { 'Blog' }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title('About Us')) }
  end
  
  describe "FAQ page" do
    before { visit faq_path }

    it { should have_selector('h1', text: 'Frequently Asked Questions') }
    it { should have_title(full_title('FAQ')) }
  end

  describe "Links on layout" do
    it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "FAQ"
    expect(page).to have_title(full_title('FAQ'))
    click_link "Blog"
    expect(page).to have_title(full_title('Blog'))
    click_link "my pancake"
    expect(page).to have_title(full_title(''))
    end
  end
end

