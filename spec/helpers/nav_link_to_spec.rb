require 'spec_helper'

describe NavLinks::ViewHelpers do
  describe '#nav_link_to' do
    let(:link_generator) do
      lg = double("LinkGenerator")
      lg.stub(:to_html => true)
      lg
    end

    before { helper.stub(:request => :request) }

    it 'accepts only a title and a path' do
      NavLinks::LinkGenerator.should_receive(:new).with(:request, "My Title", "/path", {}, {})
        .and_return(link_generator)

      helper.nav_link_to("My Title", "/path")
    end

    it 'accepts a block that returns the title' do
      NavLinks::LinkGenerator.should_receive(:new).with(:request, "My Title", "/path", {}, {})
        .and_return(link_generator)

      helper.nav_link_to("/path") do
        "My Title"
      end
    end

    it "accepts options and html_options parameters" do
      NavLinks::LinkGenerator.should_receive(:new).with(:request, "My Title", "/path", :html_options, :options)
        .and_return(link_generator)

      helper.nav_link_to("My Title", "/path", :html_options, :options)
    end
  end

end