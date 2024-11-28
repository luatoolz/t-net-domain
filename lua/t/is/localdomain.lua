local t=t or require "t"
local tld=t.net.tld
local ip=t.match.ip
local domain=t.match.domain
return function(d)
  d=domain(tostring(d))
  return (d and (not ip(d)) and (not tld(d))) and true or nil
end