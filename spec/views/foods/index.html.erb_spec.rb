require 'rails_helper'

RSpec.describe "foods/index", type: :view do
  before(:each) do
    assign(:foods, [
      Food.create!(
        :name => "Name",
        :calories => 1.5
      ),
      Food.create!(
        :name => "Name",
        :calories => 1.5
      )
    ])
  end

  it "renders a list of foods" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
