require 'spec_helper'

describe Adp::Product::Userinfo do
  it 'has a version number' do
    expect(Adp::Product::Userinfo::VERSION).not_to be nil
  end

  clientcredential_config = Adp::Connection::ClientCredentialConfiguration.new({});
  connection = Adp::Connection::ApiConnectionFactory::createConnection(clientcredential_config)

  it 'create new Helper item' do
    # expect(true).to eq(true)
    expect(Adp::Product::Userinfo::Helper.new(connection)).not_to be nil
  end
end
