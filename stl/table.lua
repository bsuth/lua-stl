local
function
assign
(t,...)
for
_
,
_t
in
pairs(
{
...
,
}
)
do
for
key
,
value
in
pairs(
_t
)
do
if
type(
key
)
==
(
'string'
)
then
t
[
key
]
=
value
end
end
end
end
local
function
clone
(t)
local
result
=
{
}
for
key
,
value
in
pairs(
t
)
do
if
type(
value
)
==
(
'table'
)
then
result
[
key
]
=
clone(
value
)
else
result
[
key
]
=
value
end
end
return
result
end
local
function
copy
(t)
local
result
=
{
}
for
key
,
value
in
pairs(
t
)
do
result
[
key
]
=
value
end
return
result
end
local
function
default
(t,...)
for
_
,
_t
in
pairs(
{
...
,
}
)
do
for
key
,
value
in
pairs(
_t
)
do
if
type(
key
)
==
(
'string'
)
and
t
[
key
]
==
nil
then
t
[
key
]
=
value
end
end
end
end
local
function
filter
(t,callback)
local
result
=
{
}
for
key
,
value
in
pairs(
t
)
do
if
callback(
value
,
key
)
then
if
type(
key
)
==
(
'number'
)
then
table
.insert(
result
,
value
)
else
result
[
key
]
=
value
end
end
end
return
result
end
local
function
find
(t,callback)
if
type(
callback
)
==
(
'function'
)
then
for
key
,
value
in
pairs(
t
)
do
if
callback(
value
,
key
)
then
return
value
,
key
end
end
else
for
key
,
value
in
pairs(
t
)
do
if
value
==
callback
then
return
value
,
key
end
end
end
end
local
function
keys
(t)
local
result
=
{
}
for
key
,
value
in
pairs(
t
)
do
table
.insert(
result
,
key
)
end
return
result
end
local
function
map
(t,callback)
local
result
=
{
}
for
key
,
value
in
pairs(
t
)
do
local
newValue
,
newKey
=
callback(
value
,
key
)
if
newKey
~=
nil
then
result
[
newKey
]
=
newValue
elseif
type(
key
)
==
(
'number'
)
then
table
.insert(
result
,
newValue
)
else
result
[
key
]
=
newValue
end
end
return
result
end
local
function
reduce
(t,result,callback)
for
key
,
value
in
pairs(
t
)
do
result
=
callback(
result
,
value
,
key
)
end
return
result
end
local
function
reverse
(t)
local
len
=
#
t
for
i
=
1
,
math
.floor(
len
/
2
)
do
t
[
i
]
,
t
[
len
-
i
+
1
]
=
t
[
len
-
i
+
1
]
,
t
[
i
]
end
end
local
function
slice
(t,start,__ERDE_SUBSTITUTE_end__)
if start == nil then start = 
0
end
if __ERDE_SUBSTITUTE_end__ == nil then __ERDE_SUBSTITUTE_end__ = 
#
t
end
local
result
,
len
=
{
}
,
#
t
if
start
<
0
then
start
=
start
+
len
+
1
end
if
__ERDE_SUBSTITUTE_end__
<
0
then
__ERDE_SUBSTITUTE_end__
=
__ERDE_SUBSTITUTE_end__
+
len
+
1
end
for
i
=
math
.max(
start
,
0
)
,
math
.min(
__ERDE_SUBSTITUTE_end__
,
len
)
do
table
.insert(
result
,
t
[
i
]
)
end
return
result
end
local
function
values
(t)
local
result
=
{
}
for
key
,
value
in
pairs(
t
)
do
table
.insert(
result
,
value
)
end
return
result
end
return
setmetatable(
{
assign
=
assign
,
clone
=
clone
,
copy
=
copy
,
default
=
default
,
filter
=
filter
,
find
=
find
,
keys
=
keys
,
map
=
map
,
reduce
=
reduce
,
reverse
=
reverse
,
slice
=
slice
,
values
=
values
,
}
,
{
__index
=
table
,
}
)
-- Compiled with Erde 0.5-1
-- __ERDE_COMPILED__