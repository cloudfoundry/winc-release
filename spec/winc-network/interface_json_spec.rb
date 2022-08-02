require 'rspec'
require 'bosh/template/test'
require 'yaml'
require 'json'


module Bosh::Template::Test
  describe 'template rendering' do
    let(:release_path) {File.join(File.dirname(__FILE__), '../..')}
    let(:release) {ReleaseDir.new(release_path)}

    describe 'winc-network' do let(:job) {release.job('winc-network')}
      describe 'interface.json.erb' do
        let(:template) {job.template('config/interface.json')}

        describe 'is backward compatible with installations not specifying subnet_range' do
          let(:merged_manifest_properties) do
            {
            }
          end

          it 'renders the default interfaces.json' do
            jsonRendered = JSON.parse(template.render(merged_manifest_properties))
            expect(jsonRendered).to eq({
              "subnet_range" =>"172.30.0.0/22",
              "gateway_address" => "172.30.0.1",
              "mtu" => 0,
              "network_name" => "winc-nat",
              "maximum_outgoing_bandwidth" => 0,
              "dns_servers" => [],
            })
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

          it 'chooses the first usable IP address of the subnet' do
            jsonRendered = JSON.parse(template.render(merged_manifest_properties))
            expect(jsonRendered['subnet_range']).to eq('192.168.5.0/28')
            expect(jsonRendered['gateway_address']).to eq('192.168.5.1')
          end
        end
        describe 'when an invalid subnet range is specified' do
          let (:merged_manifest_properties) do
            {
              'winc_network' => {
                'subnet_range' => '100.256.250.0/128',
              },
            }
          end

          it 'raises an error during template rendering' do
            expect do
              template.render(merged_manifest_properties)
            end.to raise_error(/Invalid 'winc_network.subnet_range': /)
          end
        end
        describe 'when subnet_range prefix length is < 1 bits' do
          let (:merged_manifest_properties) do
            {
              'winc_network' => {
                'subnet_range' => '100.255.250.0/0',
              },
            }
          end

          it 'raises an error during template rendering' do
            expect do
              template.render(merged_manifest_properties)
            end.to raise_error(/Invalid 'winc_network.subnet_range': subnet_range prefix length must be between 1 and 30/)
          end
        end
        describe 'when subnet_range prefix length is > 30 bits' do
          let (:merged_manifest_properties) do
            {
              'winc_network' => {
                'subnet_range' => '100.255.250.0/31',
              },
            }
          end

          it 'raises an error during template rendering' do
            expect do
              template.render(merged_manifest_properties)
            end.to raise_error(/Invalid 'winc_network.subnet_range': subnet_range prefix length must be between 1 and 30/)
          end
        end
      end
    end
  end
end
