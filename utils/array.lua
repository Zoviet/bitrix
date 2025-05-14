local _M = {}

function _M.keys(t)
  local keys = {}
  for key,_ in pairs(t) do
    table.insert(keys, key)
  end
  return keys
end

function _M.merge(t1,t2)
  for k,v in pairs(t2) do
	table.insert(t1,v)
  end
  return t1
end

function _M.count(t)
  local count = 0
  for key,_ in pairs(t) do
    count = count + 1
  end
  return count
end

function _M.minkey(t)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a)
	return a[1]
end

function _M.implode(t,before,after,sep)
  local result = ''
  local count = _M.count(t)
  for key,val in pairs(t) do  
	result = result..before..val..after
	if key < count then result = result..sep end
  end
  return result
end

return _M
