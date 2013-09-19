module NavLinks
  module ViewHelpers
    def nav_link_to(*args, &block)
      title = block_given? ? capture(&block) : args.shift
      path         = args[0]
      html_options = args[1] || {}
      options      = args[2] || {}

      LinkGenerator.new(request, title, path, html_options, options).to_html
    end
  end
end

ActionView::Base.send :include, NavLinks::ViewHelpers