require 'spec_helper'

provider_class = Puppet::Type.type(:linux_firewall).provider(:iptables)
describe provider_class do


  context "when destroying" do

    before :each do
      @resource =  Puppet::Type::Linux_firewall.new(
        {:name => 'rule1', :source_ip => '2.3.4.5/32', :dest_ip => '3.4.5.6/32'}
      )
    end

       it "destroys a rule that matches the resource instance's source, dest and name" do

        d = provider_class.new(@resource)
        d.should_receive("iptables").with(["-D", "INPUT", "-s", "2.3.4.5/32", "-d", "3.4.5.6/32", "-m", "comment", "--comment", "rule1", "-j", "REJECT"])
        d.destroy
     end

  end

end
