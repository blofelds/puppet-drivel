require 'spec_helper'

describe Puppet::Type.type(:linux_firewall).provider(:iptables) do

  let(:resource) do
    Puppet::Type.type(:linux_firewall).new(
      :name => 'rule1',
      :source_ip => '2.3.4.5/32',
      :dest_ip => '3.4.5.6/32',
    )
  end

  describe 'destroy' do
  @resource =  Puppet::Type::Linux_firewall.new( {:name => 'rule1', :source_ip => '2.3.4.5/32', :dest_ip => '3.4.5.6/32'} )
  let (:provider) { Puppet::Type.type(:linux_firewall).provider(:iptables).new(@resource)}

    it "destroys a rule that matches the resource instance's source, dest and name" do

    provider.destroy.should == '-D INPUT -s 2.3.4.5/32 -d 3.4.5.6/32 -m comment --comment name -j REJECT'

    end
  end

end
