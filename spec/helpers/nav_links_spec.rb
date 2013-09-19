require 'spec_helper'

describe NavLinks::ViewHelpers do
  describe '#nav_links' do
    let(:link_generator) do
      lg = double("LinkGenerator")
      lg.stub(:to_html => true)
      lg
    end

    before { helper.stub(:request => :request) }

    it 'does nothing when called without options' do
      NavLinks::LinkGenerator.should_receive(:new).with(:request, "My Title", "/path", {}, {})
        .and_return(link_generator)

      helper.nav_links do |n|
        n.nav_link_to("My Title", "/path")
      end
    end

    it 'applies the options to links created inside' do
      NavLinks::LinkGenerator.should_receive(:new).with(:request, "My Title", "/path", {}, {foo: :bar})
        .and_return(link_generator)

      helper.nav_links foo: :bar do |n|
        n.nav_link_to("My Title", "/path")
      end
    end

    it 'lets the options be overridden by individual calls' do
      NavLinks::LinkGenerator.should_receive(:new).with(:request, "My Title", "/path", {}, {foo: :baz})
        .and_return(link_generator)

      helper.nav_links foo: :bar do |n|
        n.nav_link_to("My Title", "/path", {}, {foo: :baz})
      end
    end

  end

end