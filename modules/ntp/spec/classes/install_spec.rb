require 'spec_helper'

describe 'ntp' do
  describe 'ntp::install' do
    it 'should contain the class ntp::install' do
      should contain_class('ntp::install')
    end
  
    it 'should contain ntp package' do
      should contain_package('ntp').with(
        'ensure' => 'installed',
      )
    end  
  end
end
