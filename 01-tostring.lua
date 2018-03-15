-- operadores
-- <  (menor que)
-- >  (maior que)
-- <= (menor ou igual)
-- >= (maior ou igual)
-- == (igual)
-- ~= (diferente)

-- operadores logicos
-- not (not true==false)
-- and (a and b == true)
-- or (a or b==false)

-- concatenacao
-- "a" .. "b"              -- resulta em "ab"
-- "VILMAR" .. "CATAFESTA" -- resulta em "VILMAR CATAFESTA"

-- #: Comprimento
-- #"ab"      -- resulta em 2
-- #{3,4,3,2} -- resulta em 4

-- nil: not in list
null  = nil 

-- boolean: 
OK    = true   -- verdadeiro
FALSO = false  -- falso

-- number: numerico
x       = 1
y       = 2.5
pi      = 3.14
address = 0x0000aaf8

-- string: texto
endereco = "Av Castelo Branco, 693"

-- table: tabelas ->tipo de dados estruturado
TPessoa       = {}
TPessoa.nome  = "VILMAR CATAFESTA"
TPessoa.email = "vcatafesta@gmail.com"
TPessoa.idade = 36

cliente =
{
	   nome  = "Evili Franciele da Silva Soares",
	   idade = 51,
	endereco = "Av Castelo Branco"
}

pares = { 0, 2, 4, 6, 8, 10 }

-- function: funcoes

soma = function(a,b)
	return a + b
end	

function cub(x,y)
	return x ^ y
end

function quad(x,y)
	return x * y
end

function teste()
	local a = 2 + 3 -- integer
	print("  O resultado:  " .. tostring(a))
	return a;
end

local v2 = { 22,310,55,61}

function fnImprimePares(a)
------------------------
	if a == nil then
		return nil
	end
	for i, v in pairs(a) do
		print(i, v)
	end
end

-- thread: corrotinas

-- userdata: tipos customizados definidos pelo usuario (em C)

print(" TPessoa.nome: ", TPessoa.nome)
print("     #TPessoa: ", #TPessoa)
print("      Retorno: ", teste())
print("       Cubico: ", cub(3, 2))
print("     Quadrado: ", quad(3, 3))
print("      #pessoa: ", #pares)
print("#cliente.nome: ", #cliente.nome)

print( fnImprimePares( v2 ))
print( fnImprimePares( nil ))

function foo (a)
       print("foo", a)
       return coroutine.yield(2*a)
     end
     
     co = coroutine.create(function (a,b)
           print("co-body", a, b)
           local r = foo(a+1)
           print("co-body", r)
           local r, s = coroutine.yield(a+b, a-b)
           print("co-body", r, s)
           return b, "end"
     end)
     
     print("main", coroutine.resume(co, 1, 10))
     print("main", coroutine.resume(co, "r"))
     print("main", coroutine.resume(co, "x", "y"))
     print("main", coroutine.resume(co, "x", "y"))

print( "\n\n")

function exec(f, x, y)
	return f(x,y)
end

local a = 3
local b = 2
res     = exec(soma, a, b)	
print("res = exec(soma, a, b)",	res)

funcs   = { soma, cub, math.pow, function(a,b) return a-b end }
res     = {}

for i = 1, #funcs do
	res[i] = exec(funcs[i], a, b)		
end	
for i, v in pairs(res) do
	print(i, v)
end	

print("\n\n")

-----------------------------------------------------------------------------
function concatenar(...)
	local args = {...}
	local ret = ""

	for i, str in ipairs(args) do
		ret = ret .. str;
	end
	return ret;
end
print(concatenar("a","b"))

print("-----------------------------------------------------------------------------")

function genSoma(parcela)
	local fn = function(x)
		return parcela + x
	end
	return fn
end
print(res)
print(genSoma(10))
soma2 = genSoma(2)
print(soma2(10))

print("-----------------------------------------------------------------------------")

local s  = "Macrosoft Curso de Lua"
ini, fim = string.find(s, "soft")
print(s)
print(string.sub(s, ini, fim))
print(ini)
print(fim)

print("-----------------------------------------------------------------------------")