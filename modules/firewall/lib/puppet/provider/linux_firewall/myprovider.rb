# GS 19/5/2014
#
# Puppet Provider to drive iptables
 
Puppet::Type.type(:linux_firewall).provide(:myprovider) do
  commands :iptables => 'iptables'

  def get_rules_list
    begin
      output = iptables(['-n', '-L', 'INPUT', '--line-numbers'])
    rescue Puppet::ExecutionFailure => e
      Puppet.debug("#get_rules_list had an error -> #{e.inspect}")
      return nil
    end

    rules_list = output.split("\n")
    puts output
    puts output.first
    return nil if rules_list.first =~ /Chain.*/
    rules_list
  end

  def exists?
    get_rules_list != nil
  end

  def destroy
    iptables(['-F', nil])
  end

  def create
    iptables(['-A', 'INPUT', '-s', resource[:source_ip], '-d', resource[:dest_ip], '-j', 'REJECT'])
  end
  


end
