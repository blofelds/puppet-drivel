# GS 14/5/2014
#
# Manage firewalls and firewall rules

Puppet::Type.newtype(:linux_firewall) do
  @doc = "Input firewall rules. Currently only iptables"

  ensurable

  newparam(:name, :namevar => :true) do
# this should probably be a property instead of a param
    desc "The name of the rule - stored in the rules comment field"
    munge do |value|
      value.downcase
    end
    def insync?(is)
      is.downcase == should.downcase
    end
  end

  newproperty(:source_ip) do
    desc "The source ip"
  end

  newproperty(:dest_ip) do
    desc "The dest_ip"
  end

# prolly need to define "insync?"
end
