local t=t or require "t"
--local domain=t.net.domain
--local isdomain=t.is.net.domain
local tld=t.net.tld
return function(d) return (d and (not tld(tostring(d)))) and true or nil end
--return isdomain(d) and (not tld(d)) or nil end
--  if isdomain(d) then return (not tld(d)) and true or nil end
--end