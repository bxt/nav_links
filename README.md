# Behold, the NavLinks:

[![Build Status](https://travis-ci.org/bxt/wptemplates.png?branch=master)](https://travis-ci.org/bxt/wptemplates)
[![Gem Version](https://badge.fury.io/rb/nav_links.png)](http://badge.fury.io/rb/nav_links)

Gem. Rails. Nav links. The nav_link_to helper works just like the standard Rails link_to helper, but adds a 'selected' class to your link (or its wrapper) if certain criteria are met. By default, if the link's destination url is the same url as the url of the current page, a default class of 'selected' is added to the link. Just replace `link_to` with `nav_link_to` in your templates.

## Installation

Add this line to your application's Gemfile:

    gem 'nav_links'

And then execute:

    $ bundle

## Usage

The `nav_link_to` helper is used just like the good old `link_to` rails helper:

    <%= nav_link_to 'My Page', my_path %>

When `my_path` is the same as the current page url, this outputs:

    <a class="selected" href="http://example.com/page">My Page</a>

For more options and full usage details, see: http://viget.com/extend/rails-selected-nav-link-helper

### Usage with blocks:

Same usage as `link_to`:

    <%= nav_link_to 'http://example.com/page' do %>
      <strong>My Page</strong>
    <% end %>

### Group links with same options

You can reduce duplication and wrap `nav_link_to` calls with the same options with a call to `nav_links` like this:

    <ul class="nav">
      <% nav_links url_segment: 1, wrapper: 'li', selected_class:'active' do |nav| %>
        <%= nav.link_to "Projects", projects_path %>
        <%= nav.link_to "People", people_path %>
        <%= nav.link_to "About", about_path %>
      <% end %>
    </ul>

## Rainy day?

Here's what you can do on a rainy day:

  - Write integration tests
  - Extend docs

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

This gem is mostly based on the gem [nav_lynx](https://github.com/vigetlabs/nav_lynx) and sponsored by [Sophisticates GmbH](http://sophisticates.de/)

