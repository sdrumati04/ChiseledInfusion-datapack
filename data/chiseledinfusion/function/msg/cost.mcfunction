function chiseledinfusion:msg/enchlist
data modify storage ci:msg msg.extra append value {text:" • "}
data modify storage ci:msg msg.extra append value {"score":{name:"#cost",objective:"ci.tmp"}}
data modify storage ci:msg msg.extra append value {text:" Levels, "}
data modify storage ci:msg msg.extra append value {"score":{name:"#cat",objective:"ci.tmp"}}
data modify storage ci:msg msg.extra append value {text:"x "}
data modify storage ci:msg msg.extra append value {"nbt":"catalyst_name","storage":"ci:cfg","interpret":1b}
