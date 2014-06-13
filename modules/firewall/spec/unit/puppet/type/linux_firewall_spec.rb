require 'spec_helper'

describe Puppet::Type.type(:linux_firewall) do

  let :linux_firewall do
    Puppet::Type.type(:linux_firewall).new(
      :name => 'foo',
      :source_ip => '1.2.3.4',
      :dest_ip => '2.3.4.5',
    )
  end

  describe "the ensure method" do
    it "it should default ensure => present" do
      linux_firewall[:ensure].should eq :present
    end
  end

  describe "the name parameter" do
    it do
    end
  end

  describe "the source_ip parameter" do
    it "should accept a cidr ip address" do
      linux_firewall[:source_ip] = '1.2.3.4/32'
      linux_firewall[:source_ip].should == '1.2.3.4/32'
    end
  end

  describe "the dest_ip parameter" do
    it "should accept a cidr ip address" do
      linux_firewall[:source_ip] = '1.2.3.4/32'
      linux_firewall[:source_ip].should == '1.2.3.4/32'
    end
  end

end
