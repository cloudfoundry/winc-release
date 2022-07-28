require 'rspec'
require 'bosh/template/test'
require 'yaml'
require 'json'


module Bosh::Template::Test
  describe 'template rendering' do
    let(:release_path) {File.join(File.dirname(__FILE__), '../..')}
    let(:release) {ReleaseDir.new(release_path)}

    describe 'winc-network-hns-acls' do let(:job) {release.job('winc-network-hns-acls')}
      describe 'addresses.json.erb' do
        let(:template) {job.template('dns/addresses.json')}

        describe 'is backward compatible with installations not specifying subnet_range' do
          let(:merged_manifest_properties) do
            {
            }
          end

          it 'renders the default addresses.json' do
            jsonRendered = JSON.parse(template.render(merged_manifest_properties))
            expect(jsonRendered).to eq([{
              "address" => "172.30.0.1",
              "port" => 53,
            }])
          end
        end
        describe 'when a valid subnet range is specified' do
          let (:merged_manifest_properties) do
            {
              'winc_network' => {
                'subnet_range' => '192.168.5.0/28',
              },
            }
          end

          it 'uses the calculated gateway addr as the default DNS entry' do
            jsonRendered = JSON.parse(template.render(merged_manifest_properties))
            expect(jsonRendered).to eq([{
              "address" => "192.168.5.1",
              "port" => 53,
            }])
          end
        end
      end
    end
  end
end
