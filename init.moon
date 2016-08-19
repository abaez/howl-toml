--- toml lexer for howl from [ta-toml](https://bitbucket.org/a_baez/ta-toml)
-- See @{README.md} for details on usage.
-- @author [Alejandro Baez](https://keybase.io/baez)
-- @copyright 2016
-- @license MIT (see LICENSE)
-- @module toml

mode_reg =
  name: 'toml'
  aliases: 'toml'
  extensions: 'toml'
  create: -> bundle_load('toml_mode')

howl.mode.register mode_reg

unload = -> howl.mode.unregister 'toml'

return {
  info:
    author: 'Alejandro Baez https://keybase.io/baez',
    description: 'Toml language support',
    license: 'MIT',
  :unload
}
