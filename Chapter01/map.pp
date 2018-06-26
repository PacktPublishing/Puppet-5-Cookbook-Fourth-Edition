$count = [1,2,3,4,5]
$map = map ($count) | $i | { $i * $i }
notice("Square of array is ${map}")
