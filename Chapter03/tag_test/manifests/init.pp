class tag_test {
  if tagged('tagging') {
    notify { 'containing node/class was tagged.': }
  }
}
