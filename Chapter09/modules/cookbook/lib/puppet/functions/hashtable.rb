Puppet::Functions.create_function(:hashtable) do
  dispatch :hashinput do
    param 'String', :input
  end
  dispatch :hashmod do
    param 'Integer', :mod
  end
  dispatch :hashinputmod do
    param 'Integer', :mod
    param 'String', :input
  end
  dispatch :hashhost do end
  def hashinput(input)
    scope = closure_scope
    f = scope['facts'][input]
    f.sum % 60
  end
  def hashhost()
    scope = closure_scope
    hostname = scope['facts']['hostname']
    hostname.sum % 60
  end
  def hashmod(mod)
    scope = closure_scope
    f = scope['facts']['hostname']
    f.sum % mod
  end
  def hashinputmod(mod,input)
    scope = closure_scope
    f = scope['facts'][input]
    f.sum % mod
  end
end
