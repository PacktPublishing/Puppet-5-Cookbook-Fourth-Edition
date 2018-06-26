Facter.add(:users) do
  setcode do
    %x{/usr/bin/who |wc -l}.chomp
  end
end
