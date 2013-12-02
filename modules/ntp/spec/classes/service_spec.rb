require 'spec_helper'

describe 'ntp' do
  it 'should contain service' do
    should contain_service('ntpd')
  end

  it 'should inherit ntp' do
    should include_class('ntp')
  end

  it 'should contain ntp service' do
    should contain_service('ntpd').with(
      'ensure' => 'running',
      'enable' => 'true',
    )
    end

end
