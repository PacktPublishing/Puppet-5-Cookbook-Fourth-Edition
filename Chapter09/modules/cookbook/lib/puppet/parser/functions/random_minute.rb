Puppet::Functions.create_function(:random_minute) do
  dispatch :randMin do end

  def randMin()
    scope = closure_scope
    hostname = scope['facts']['hostname']
    hostname.sum % 60
  end
end
