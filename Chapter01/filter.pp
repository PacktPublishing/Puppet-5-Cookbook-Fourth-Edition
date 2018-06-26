$count = [1,2,3,4,5]
$filter = filter ($count) | $i | { $i > 3 }
notice("Filtered array is $filter")
