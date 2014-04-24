require 'spec_helper'

describe 'users::accounts' do
  describe 'specifying with default values' do
    let ( :title ) { 'testuser' }

    it do
      should contain_user( title ).with({
        'ensure'  =>  'present',
        'username'  =>  $title,
        'password'  =>  '!',
      })

    end
  end
at_exit { RSpec::Puppet::Coverage.report! }
end
