require 'spec_helper'

describe 'repos::yumrepos' do
  describe 'with default values' do
    let ( :title ) { 'testrepo' }
    let ( :baseurl ) { 'baseurl' }

    it do
      should contain_yumrepo( title ).with({
        'name' => 'testrepo',
        'enabled'   => '1',
        'gpgcheck'  => '0',
    })

    end
  end
end
