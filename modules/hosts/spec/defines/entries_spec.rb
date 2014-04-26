require 'spec_helper'

describe 'hosts::entries' do
  describe 'specifying with default values' do
    let ( :title ) { 'test' }

    it do
      should contain_host( title ).with({
        'ip' => '0.0.0.0'})
    end
  end
at_exit { RSpec::Puppet::Coverage.report! }
end
