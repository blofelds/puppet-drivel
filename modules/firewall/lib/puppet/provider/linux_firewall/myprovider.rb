# GS 19/5/2014
#
# Puppet Provider to drive iptables
 
Puppet::Type.type(:linux_firewall).provide(:myprovider) do
  commands :iptables => 'iptables'

  def get_rules_list
    begin
      output = iptables(['--list-rules', 'INPUT'])
    rescue Puppet::ExecutionFailure => e
      Puppet.debug("#get_rules_list had an error -> #{e.inspect}")
      return nil
    end

    rules_list = output.split("\n").sort
    return nil if rules_list.first != /-A/
    rules_list
  end

  def exists?
    get_rules_list =~ nil
  end

  def destroy
    iptables(['-F', nil])
  end

  def create
    iptables(['-A', 'INPUT', '-s', resource[:source_ip], '-d', resource[:dest_ip], '-m', 'comment', '--comment', resource[:name], '-j', 'REJECT'])
  end
  


end
