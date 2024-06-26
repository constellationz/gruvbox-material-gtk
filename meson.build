project(
  'gruvbox-material-gtk',
  version: '20210322',
  license: 'GPLv2+',
  meson_version: '>= 0.47.0',
  default_options: ['prefix=/usr'],
)

theme_base_name = get_option('theme_name')
theme_base_dir = join_paths(get_option('datadir'), 'themes', theme_base_name)

# Avoid printing 'Program sh found' multiple times
# if meson version is >= 0.55.0
if meson.version().version_compare('>= 0.55.0')
  sh = find_program('sh')
else
  sh = 'sh'
endif

sass = find_program('sass', required: false)
sass_opts = ['--no-source-map']

if sass.found()
  sass_full_version = run_command(sass, '--version').stdout()
  sass_is_ruby_sass = sass_full_version.contains('Ruby Sass')
  sass_has_module_system = sass_full_version.version_compare('>= 1.23.0')
endif

if not sass.found() or sass_is_ruby_sass or not sass_has_module_system
  message('dart-sass >= 1.23.0 not found, installing it locally via npm')
  npm = find_program('npm')
  run_command(npm, 'install')
  sass = find_program('./node_modules/.bin/sass')
endif

themes = []
foreach color: get_option('colors')
  color_suffix = color == 'default' ? '' : '-@0@'.format(color)
  scss_dark_theme = color == 'Dark' ? 'true' : 'false'
  themes += {
    'name': theme_base_name + color_suffix ,
    'dir': theme_base_dir + color_suffix,
    'color': color_suffix,
    'scss_dark_theme': scss_dark_theme,
  }
endforeach

foreach theme: themes
  install_data(
    [
      'COPYING',
    ],
    install_dir: theme['dir'],
  )
endforeach

if not get_option('flatpak')
  subdir('src')
else
  subdir('src/gtk-3.0')
  subdir('src/gtk-4.0')
endif
