function euclidean_algorithm(num1,num2)
	if b>0 then
--		local remainder= num1 % num2
		return euclidean_algorithm(b, num1 % num2)		
	end
	return num1
end

--gcd=euclidean_algorithm

function least_common_multiple(a,b)
	local min= math.min(a,b) --(a > b) and b or a; -- a > b ? b : a
	local max= math.max(a,b) --(a > b) and a or b; -- a > b ? a : b
	return (max / gcd(min,max)) * min
end

--lcm=least_common_multiple

function prime_numbers_in_range(p)
	local tab={}
	
end

function extended_euclidean_algorithm(a,b)
    local min=math.min(a,b)
    local max=math.max(a,b)
    local q={}
    local p={0,1}
    local function euclidean_algorithm_generate_q(c,d)
      table.insert(q,math.floor(d/c))--Where d > c
      --print(tostring(math.max(c,d)).." = "..tostring(math.floor(math.max(c,d)/math.min(c,d))).."("..tostring(math.min(c,d))..") + "..tostring(d%c))
      if d%c~=0 then
        euclidean_algorithm_generate_q(d%c,c)
      end
    end
    euclidean_algorithm_generate_q(min,max)
    for i=1,#q-1 do
      table.insert(p,( p[i] - (p[i+1] * q[i]) ) % max )
      print(tostring(p[i]).." - "..tostring(p[i+1]).."("..tostring(q[i])..") mod "..tostring(max).." = "..tostring(p[i]-(p[i+1]*q[i])).." mod "..tostring(max).." = "..tostring(p[i+2]))
    end
end
extended_euclidean_algorithm(26,15)