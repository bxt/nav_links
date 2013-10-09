module NavLinks
  module ViewHelpers
    def nav_link_to(*args, &block)
      title = block_given? ? capture(&block) : args.shift
      path         = args[0]
      html_options = args[1] || {}
      options      = args[2] || {}

      LinkGenerator.new(request, title, path, html_options, options).to_html
    end

    def nav_links(options = {})
      raise ArgumentError, "Missing block" unless block_given?
      option_wrapper = NavLinksOptions.new(self, options)
      yield option_wrapper
    end

    class NavLinksOptions
      def initialize(base, options = {})
        @base = base
        @options = options
      end

      def link_to(*args, &block)
        index = block_given? ? 2 : 3
        args[index] = @options.merge(args[index] || {})

        @base.nav_link_to(*args, &block)
      end

      alias_method :nav_link_to, :link_to # deprecated, remove in 2.x

    end
  end
end

ActionView::Base.send :include, NavLinks::ViewHelpers
