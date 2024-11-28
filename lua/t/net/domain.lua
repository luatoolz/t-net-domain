local t=t or require "t"
local pkg=t.pkg(...)
local tld=pkg.tld
local join=string.joiner('.')
local match=t.match
return setmetatable({},{
__call=function(self, it)
  if type(it)=='table' and getmetatable(it)==getmetatable(self) then return it end
  it=match.domain(tostring(it))
  if type(it)~='string' or #it==0 then return nil end
  local x=tld(it)
  local rv=it:lower():split('.')
  if type(rv)~='table' then return nil end
  if type(x)~='table' then return #rv>1 and setmetatable(table.sub(rv, -2), getmetatable(self)) or nil end
  if #rv==#x then return nil end
  while #rv>#x+1 do table.remove(rv, 1) end
  setmetatable(rv, getmetatable(self))
  if type(rv[1]:match('[%w_]+'))=='string' then
    return setmetatable(rv, getmetatable(self))
  end
end,
__concat=function(self, host)
  if #self>0 and type(host)=='string' and #host>0 then return join(host, tostring(self)) end
end,
__export=function(self)
  if #self>0 then return join(self) end
end,
__index=function(self, k)
  if k=='tld' then return tld(tostring(self)) end
  if k=='islocal' then return (not self.tld) and true or nil end
  return rawget(self, k)
end,
__tostring=function(self)
  return #self>1 and join(self) or ''
end,
__eq = function(a, b)
  return tostring(a)==tostring(b)
end,
})