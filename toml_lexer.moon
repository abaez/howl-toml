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

  -- Datetime.
  timestamp = c 'timestamp',
    digit^-4 * -- year
    '-' * digit^-2 * -- month
    '-' * digit^-2 * -- day
    ( (S' \t'^1 + S'tT')^-1 * -- separator
      digit^-2 * -- hour
      ':' * digit^-2 * -- minute
      ':' * digit^-2 * -- second
      ('.' * digit^0)^-1 * -- fraction
      ( 'Z' + -- timezone
        S' \t'^0 *
        S'-+' *
        digit^-2 *
        (':' * digit^-2)^-1
      )^-1
    )^-1

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

