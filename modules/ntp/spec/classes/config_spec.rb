require 'spec_helper'

describe 'ntp' do
  describe 'ntp::config' do
    it 'should contain the class ntp::config' do
      should contain_class('ntp::config')
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

    context 'when $update is defined it' do
      let(:params) {{ :update => 'yes' }}

      it 'should execute the ntpdate command' do
        should contain_exec('update date')
      end
    end

    context 'when $update is not defined it' do
      let(:params) {{ :update => '' }}

      it 'should not execute the ntpdate command' do
        should_not contain_exec('update date')
      end
    end

    context 'when $update is defined and $infra_server set to 0.0.0.0' do
      let(:params) {{ :infraserver  => '0.0.0.0',
                      :update       => '1' }}

   # this test needs to be fixed
      it 'should execute the ntpdate command' do
        should contain_exec('update date').with(
          'require' => 'File[ntp.conf]',
   #      'command' => '/usr/sbin/ntpdate ${infra_server}',
   #      'command' => '/usr/sbin/ntpdate 0.0.0.0',
          'onlyif'  => '/etc/init.d/ntpd status | grep stopped',
      )  
      end
    end

  end
end
