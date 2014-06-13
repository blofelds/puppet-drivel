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
    it do
    end
  end

  describe 'destroy' do
    it do
    end
  end

  describe 'create' do
    it do
    end
  end

end
