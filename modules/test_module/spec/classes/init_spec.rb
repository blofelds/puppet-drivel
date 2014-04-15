require 'spec_helper'

describe 'test_module' do

it { should contain_class('test_module') }
it { should contain_file('file1').with({
  'path'    => '/var/tmp/testfile1',
  }) }
it { should contain_file('file1').with_content(/^blarbl/) }

at_exit { RSpec::Puppet::Coverage.report! }

end


