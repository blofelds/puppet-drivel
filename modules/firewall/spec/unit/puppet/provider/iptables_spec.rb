require 'spec_helper'

describe Puppet::Type.type(:linux_firewall).provider(:iptables) do

  let(:resource) do
    Puppet::Type.type(:linux_firewall).new(
      :name => 'rule1',
      :source_ip => '2.3.4.5/32',
      :dest_ip => '3.4.5.6/32',
    )
  end

  describe 'get_rules_list' do
    it do
    end
  end

  describe 'exists?' do
    it "#testing...# runs the get_rules_list method and evaluate its nilness"do

    end
  end

  describe 'destroy' do
    it "destroys a rule that matches the resource instance's source, dest and name" do

        Puppet::Type.type(:linux_firewall).provider(:iptables).new(Puppet::Type::Linux_firewall.new( {:name => 'rule1', :source_ip => '2.3.4.5/32', :dest_ip => '3.4.5.6/32'} )).should == '-D INPUT -s 2.3.4.5/32 -d 3.4.5.6/32 -m comment --comment name -j REJECT'

        #command.should == '-D INPUT -s 192.168.2.1 -d 192.68.2.4 -m comment --comment name -j REJECT'
        #described_class.new
        #described_class.new.destroy
        #described_class.new.destroy(resource[:source_ip])
        #described_class.new(:name => 'myuser').destroy(resource[:source_ip])

    end
  end

  describe 'create' do
    it do
    end
  end

end
