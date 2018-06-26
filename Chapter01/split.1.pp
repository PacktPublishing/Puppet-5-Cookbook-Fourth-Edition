define lunchprint() {
 notify { "Lunch included ${name}":}
}
$lunch = ['egg', 'beans', 'chips']
lunchprint { $lunch: }
