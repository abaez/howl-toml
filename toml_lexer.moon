--- toml lexer for howl from [ta-toml](https://bitbucket.org/a_baez/ta-toml)
-- See @{README.md} for details on usage.
-- @author [Alejandro Baez](https://keybase.io/baez)
-- @copyright 2016
-- @license MIT (see LICENSE)
-- @module toml

howl.aux.lpeg_lexer ->
  c = capture
  -- shorthand for lexer.word
  ident = (alpha + '_')^1 * (alpha + digit + '_')^0

  -- Whitespace.
  ws = c 'whitespace', space

  -- Comments.
  line_comment = P'#' * scan_until eol
  comment = c 'comment', any {line_comment}

  -- Strings.
  dq_str = span '"', '"', '\\'
  raw_str = span "'", "'"
  multi_dq_str = span '"""', '"""', '\\'
  multi_raw_str = span "'''", "'''"
  string  = c 'string', any {dq_str, raw_str, multi_raw_str, multi_dq_str}


  -- Numbers.
  number = c 'number', any {
    (float + '_')^1, -- float with underscore
    (digit + '_')^1 --  int with underscore
  }

  -- Keywords.
  keyword = c 'keyword', word {
    'true', 'false'
  }

  -- Table.
  local tab = c 'table', S'['^1 * (ident + S'.')^1 * S']'^1

  -- Identifiers.
  identifier = c 'identifer', ident

  -- Operators.
  operator = c 'operator', S'+-/*%<>!=`^~@&|?#~:;,.()[]{}'

  P {
    'all'

    all: any {
      comment,
      keyword,
      timestamp,
      string,
      number,
      tab,
      operator,
      identifier,
    }
  }

