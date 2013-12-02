require 'spec_helper'

describe 'ntp' do
  it 'should include ntp::class' do
    should include_class('ntp::config')
  end

  it 'should inherit ntp' do
    should include_class('ntp')
  end

  it 'should install the conf file' do
    should contain_file('ntp.conf').with(
      'ensure'  => 'present',
      'path'    => '/etc/ntp.conf',
      'source'  => 'puppet:///modules/ntp/ntp.conf',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0400',
    )
  end

  context 'with $infra_server set to 0.0.0.' do
    let(:paras) { {:infra_server => '0.0.0.0'} }
 
    it 'should execute the ntpdate command' do
      should contain_exec('update date').with(
        'require' => 'File[ntp.conf]',
 #      'command' => '/usr/sbin/ntpdate ${infra_server}',
        'onlyif'  => '/etc/init.d/ntpd status | grep stopped',
    )  
    end
  end
# need to add some lets to describe the parameters
end
