# GS 14/5/2014
#
# Manage firewalls and firewall rules

Puppet::Type.newtype(:firewall) do
  @doc = "Input firewall rules. Currently only iptables"

  newparam(:name) do
    desc "The name of the resource"
  end

  newparam(:file) do
    desc "The file to examine and modify"
  end

  newparam(:line) do
    desc "The line of signifint interest"
  end

  newproperty(:ensure) do
    desc "Whether the resource is in sync or not"

    defaultto :insync

    def retrieve
      File.readlines(resource[:file]).map { |l|
        l.chomp
      }.include?(resource[:line]) ? :insync : :outofsync
    end

    newvalue :outofsync do
      File.open(resource[:file], 'w') { |fd| fd.truncate  }
    end

    newvalue :insync do
      File.open(resource[:file], 'a') { |fd| fd.puts resource[:line] }
    end

  end

end
