function euclidean_algorithm(num1,num2)
	if b>0 then
--		local remainder= num1 % num2
		return euclidean_algorithm(b, num1 % num2)		
	end
	return num1
end

gcd=euclidean_algorithm

function least_common_multiple(a,b)
	local min= math.min(a,b) --(a > b) and b or a; -- a > b ? b : a
	local max= math.max(a,b) --(a > b) and a or b; -- a > b ? a : b
	return (max / gcd(min,max)) * min
end

lcm=least_common_multiple

function modular_extended_euclidean_algorithm(a,b)
	local min=math.min(a,b)
	local max=math.max(a,b)
	local function inner_extended_euclidean_algorithm(c,d,e,f)
		local coefficient=math.floor(d/c)
		if e==nil or f==nil then
			e=0;
			f=1;
		end
		if d%c~=0 and (( e - (f * coefficient) ) % max)~=0 then
			print("Original: "..tostring(d)..
						" = "..tostring(coefficient)..
						"("..tostring(c)..") + "..
						tostring(d%c)
						)
			print("2 Answers Ago:	"..tostring(e))
			print("1 Answer Ago:	"..tostring(f))
			print("Coefficient: floor("..tostring(d)..
																"/"..tostring(c)..
																") = "..tostring(coefficient)
						)
			print("Original Max Number: "..tostring(max))
			print("Inverse: "..tostring(e)..
							" - "..tostring(f)..
							"("..tostring(coefficient)..") mod "..tostring(max)..
							" = "..tostring(e-(f*coefficient))..
							" mod "..tostring(max).." = "..tostring(( e - (f * coefficient) ) % max).."\n"
						)
			return inner_extended_euclidean_algorithm(d%c,c,f,( e - (f * coefficient) ) % max)
		else	
			return f
		end
	end
	return inner_extended_euclidean_algorithm(min,max)
end

emodgcd=modular_extended_euclidean_algorithm

function extended_euclidean_algorithm(a,b)
	local min=math.min(a,b)
	local max=math.max(a,b)
	local function inner_extended_euclidean_algorithm(c,d,e,f)
		local coefficient=math.floor(d/c)
		if e==nil or f==nil then
			e=0;
			f=1;
		end
		if d%c~=0 and ( e - (f * coefficient) )~=0 then
			print("Original: "..tostring(d)..
						" = "..tostring(coefficient)..
						"("..tostring(c)..") + "..
						tostring(d%c)
						)
			print("2 Answers Ago:	"..tostring(e))
			print("1 Answer Ago:	"..tostring(f))
			print("Coefficient: floor("..tostring(d)..
																"/"..tostring(c)..
																") = "..tostring(coefficient)
						)
			print("Inverse: "..tostring(e)..
							" - "..tostring(f)..
							"("..tostring(coefficient)..")"..
							" = "..tostring(e-(f*coefficient)).."\n"
						)
			return inner_extended_euclidean_algorithm(d%c,c,f,( e - (f * coefficient) ))
		else	
			return f
		end
	end
	return inner_extended_euclidean_algorithm(min,max)
end

egcd=extended_euclidean_algorithm

print("Modular Inverse Euclidean Algorithm answer: "..tostring(emodgcd(26,15)))
print("Inverse Euclidean Algorithm answer: "..tostring(egcd(26,15)))