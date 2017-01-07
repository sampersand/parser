

0 = ZERO
print(0) #=> ZERO

= GET   | $0 => =
(
  0     | $0 => 0
  ZERO  | $1 => ZERO
)
CALL    | $0 = 0, 0 => ZERO
NEWLINE | 0 => ZERO

print GET | $0 => print, 0 => ZERO
(
 0 GET    | $0 => ZERO
) # => PRINT 'ZERO'
CALL | 0 => ZERO
--------------------

= GET   | $0 => =
(
  0     | $0 => 0
  ZERO  | $1 => ZERO
)
CALL    | $0 = 0, 0 => ZERO

print GET | $0 = 0, $1 = print, 0 => ZERO
(
 0 GET    | $0 => ZERO
) # => PRINT 'ZERO'
CALL | $0 = 0, 0 => ZERO

0 = ZERO
print 0











+(4, 0 = 2, 3)







def whilst(x:)
   case x <=> 5
   when -1
      puts x
      whilst(x: x + 1)
   else
      # do nothing
   end
end
whilst(x: 0)


# whilst = {
#           # :>
#    switch(x <=> :'5'?){
#       :<? = {
#          puts x
#          whilst(x? = x + :'1'?)
#       }
#       _ = {}
#    }
# }
# whilst(x = :'0')


car = {
  :speed = 1
  :tires = 4
  :'0'   = 9
}

cont = {  #   stack   | knowns
  x = 2   #=> [2]     | {x=2}
  y = 3   #=> [2, 3]  | {x=2, y=3}
  0 = x+y #=> [2,3,5] | {x=2, y=3, 0=5}
}

cont[x] <===> index(cont, x) # => 2
cont[y] <===> index(cont, y) # => 3
cont[0] <===> index(cont, 0) # => 2

------
:index GET
(
  :cont GET
  0
)
CALL
------
index(cont, STACK, 0)
index(cont, KNOWNS, 0)



{
  3 + 4            | 7       | 
  x = STACK[0]     | 7       | x = 7
  4                | 7 4     | x = 7
  5                | 7 4 5   | x = 7
  6                | 7 4 5 6 | x = 7
  DELETE STACK[2]  | 7 4 6   | x = 7
}
cont = {
  3 + 4            | $0=7
  x = STACK[0]     | $0=7,                   x=7
  2 = 3            | $0=7,                   x=7, $1=2, 2=3
  4                | $0=7, $1=4,             x=7, 2=3
  5                | $0=7, $1=4, $2=5,       x=7, 2=3
  6                | $0=7, $1=4, $2=5, $3=6, x=7, 2=3
                   | $= {0=7, 1=4, 2=5, 3=6} x=7, 2=3
  DELETE STACK[2]  | $0=7, $1=4, $3=6,       x=7, 2=3
  DELETE STACK[2]  | $0=7, $1=4, $2=6,       x=7, 2=3
  ++++
}
c = {
  9
  4
  0 = 2;
  +
}
print(c)

cont[0] #stack
cont{0} #knowns

index(cont, STACK, 0)
index(cont, KNOWNS, 0)
index__stack(cont, 0)
index_knowns(cont, 0)





























(2 + 3) * 5
2 + 3 * 5

2 3 + 5 *









2 * (4 + 5) ^ 9 

2 4 5 + 2 ^ *
stack | remaining 
------+----------
      | 2 4 5 + 2 ^ *
2     | 4 5 + 2 ^ * 
2 4   | 5 + 2 ^ * 
2 4 5 | + 2 ^ * 
2 9   | 2 ^ * 
2 9 2 | ^ * 
2 81  | * 
162   |

2 4 5 
stack | remaining 
------+----------
      | 2 4 5
2     | 4 5
2 4   | 5
2 4 5 |


x = 3 * 4
x 3 4 * =
stack | remaining | knowns
------+-----------+-------
      | x 3 4 * = |
x     | 3 4 * =   |
x 3   | 4 * =     |
x 3 4 | * =       |
x 12  | =         |
12    |           | x=12



^ = 4 + 3
x = 5 * ^
x = 5 @ ∑

=
GET
(
  x
  *
  GET
  (
    5
    ^
  )
  CALL
)
CALL




























