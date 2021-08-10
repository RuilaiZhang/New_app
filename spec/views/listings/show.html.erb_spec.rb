require 'rails_helper'

RSpec.describe "listings/show", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      user: nil,
      title: "Title",
      condition: 2,
      price: 3,
      description: "MyText",
      sold: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
