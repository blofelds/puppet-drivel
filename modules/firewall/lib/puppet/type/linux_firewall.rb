# GS 14/5/2014
#
# Manage firewalls and firewall rules

Puppet::Type.newtype(:linux_firewall) do
  @doc = "Input firewall rules. Currently only iptables"

  ensurable do
    defaultto(:present)
    newvalue(:present) do
      provider.create
    end
    newvalue(:absent) do
      provider.destroy
    end
  end

  newparam(:name, :namevar => :true) do
# this should probably be a property instead of a param
    desc "The name of the rule - stored in the rules comment field"
  end

  newparam(:source_ip, :array_matching => :all) do
    desc "The source ip"
  end

  newparam(:dest_ip) do
    desc "The dest_ip"
  end

# prolly need to define "insync?"
end




# CREATE A "LIST" DEFINITION WHICH CONTAINS THE WHOLE LIST:- LIKE THE FOLLOWING
# this 'array matching all' could be used for the getter/setter
  def domains
    get_proxy_bypass_domains(resource[:name])
  end

  def domains=(value)
    networksetup(['-setproxybypassdomains', resource[:name], value])
  end

