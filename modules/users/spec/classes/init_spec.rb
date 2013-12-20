require 'spec_helper'


describe 'users' do

  it { should contain_class('users') }
  it { should contain_user('root').with(
    'comment' => 'rooty root',) }
context 'with "secure_host" set to "true" ' do
  let(:params) { {:secure_host => 'true'} }
  it { should contain_user('root').with(
    'password' => 'securepass') }
end
end
