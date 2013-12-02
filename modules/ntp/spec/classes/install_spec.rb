require 'spec_helper'

describe 'ntp' do
  it 'should include ntp::install class' do
    should include_class('ntp::install')
  end

  it 'should inherit ntp' do
    should include_class('ntp')
  end

  it 'should include ntp package' do
    should contain_package('ntp').with(
      'ensure' => 'installed',
    )
  end  
end
