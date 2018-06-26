File.open('/proc/meminfo') do |f|
  f.each_line { |line|
  if (line[/^Active:/])
    Facter.add(:memory_active) do
      setcode do line.split(':')[1].to_i
      end
    end
  end
  if (line[/^Inactive:/])
    Facter.add(:memory_inactive) do
      setcode do line.split(':')[1].to_i
      end
    end
  end
  }
end
