Haml::Template.options = { :attr_wrapper => '"' }

# TODO: This shouldn't be necessary when the base css imports a bunch of sass
# partials. Figure out a better way around.  Perhaps, nothing to worry about.
Sass::Plugin.options = { :always_update => true }
