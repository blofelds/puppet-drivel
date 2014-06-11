# GS 19/5/2014
#
# Puppet Provider to drive iptables
 
Puppet::Type.type(:linux_firewall).provide(:iptables) do
  commands :iptables => 'iptables'

  def get_rules_list
    finding = nil
    source = resource[:source_ip]
    destin = resource[:dest_ip]
    commen = resource[:name]

    proc = Proc.new do
      begin
        output = iptables(['-S', 'INPUT'])
      rescue Puppet::ExecutionFailure => e
        Puppet.debug("#get_rules_list had an error -> #{e.inspect}")
        return nil
      end

      list = output.split("\n").each do |line|
        if line =~ /#{source}.*#{destin}.*#{commen}/
          finding = 1
        end
      end
  
    return finding
    end
  
    proc.call
  end

  def exists?
    get_rules_list != nil
  end

  def destroy
    iptables(['-D', 'INPUT', '-s', resource[:source_ip], '-d', resource[:dest_ip], '-m', 'comment', '--comment', resource[:name], '-j', 'REJECT'])
  end

  def create
    iptables(['-A', 'INPUT', '-s', resource[:source_ip], '-d', resource[:dest_ip], '-m', 'comment', '--comment', resource[:name], '-j', 'REJECT'])
  end

end
