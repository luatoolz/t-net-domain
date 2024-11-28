rockspec_format = "3.0"
package = "t-net-domain"
version = "scm-0"

source = {
  url = "git+https://github.com/luatoolz/t-net-domain",
}

description = {
  summary = "t.net.domain: domain tld object for `t` lib",
  detailed = [[
t.net.domain: domain object for `t` lib
]],
  homepage = "https://github.com/luatoolz/t-net-domain",
  license = "MIT",
  issues_url = "https://github.com/luatoolz/t-net-domain/issues",
  maintainer = "luatoolz@somahorse.com",
}

dependencies = {
  "lua >= 5.1",
  "t",
  "t-net-tld"
}

test_dependencies = {
  "busted",
}

test = {
  type = "busted",
}

build = {
  copy_directories = {},
  type = "builtin",
}
