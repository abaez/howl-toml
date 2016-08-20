# howl-toml
[![twitter][1i]][1p]
[![license][2i]][2p]

A reimagination of [ta-toml] but for [howl].

### DESCRIPTION
Another [textadept] module being converted to [howl].

Currently, the bundle has full lexer implementation of [toml] based off of [ta-toml].

#### To Do:

* 1:1 interpretation of the [ta-toml] on [howl].

### USAGE
All you really need is to clone the repository into your `_USERHOME/bundles` directory. You can achieve this simply by first making sure the directory exist and then cloning the repository:

```
mkdir -p ~/.howl/bundles
hg clone https://a_baez@bitbucket.org/a_baez/howl-toml \
  ~/.howl/bundles/toml
```
And that's it! You are good to go with having a lexer for [toml] on [howl]!
[toml]: https://github.com/toml-lang/toml
[ta-toml]: https://bitbucket.org/a_baez/ta-toml
[howl]: https://howl.io
[textadept]: http://foicica.com/textadept

[1i]: https://img.shields.io/badge/twitter-a_baez-blue.svg
[1p]: https://twitter.com/a_baez
[2i]: https://img.shields.io/badge/license-MIT-green.svg
[2p]: ./LICENSE
