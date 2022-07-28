require 'rspec'
require 'bosh/template/test'
require 'yaml'
require 'json'


module Bosh::Template::Test
  describe 'template rendering' do
    let(:release_path) {File.join(File.dirname(__FILE__), '../..')}
    let(:release) {ReleaseDir.new(release_path)}

    describe 'winc-network-hns-acls' do let(:job) {release.job('winc-network-hns-acls')}
      describe 'interface.json.erb' do
        let(:template) {job.template('config/interface.json')}

        describe 'has backward compatible defaults' do
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
              "search_domains" => [],
              "allow_outbound_traffic_by_default" => false,
              "wait_timeout_in_seconds" => 2,
            })
          end
        end

        describe 'when subnet_range is provided manually' do
          let(:merged_manifest_properties) do
            {
              "winc_network" => {
                  'subnet_range' => '192.168.5.0/28',
              }
            }
          end
          it 'uses the provided subnet' do
            jsonRendered = JSON.parse(template.render(merged_manifest_properties))
            expect(jsonRendered['subnet_range']).to eq("192.168.5.0/28")
          end

          describe 'when a gateway_addr is not specified' do
            it 'chooses the first non-network address of the subnet' do
              jsonRendered = JSON.parse(template.render(merged_manifest_properties))
              expect(jsonRendered['gateway_address']).to eq('192.168.5.1')
            end
          end

          describe 'when gateway addr is provided manually' do
            let(:merged_manifest_properties) do
              {
                "winc_network" => {
                  'subnet_range' => '192.168.5.0/28',
                  "gateway_address" => "192.168.5.5",
                }
              }
            end

            it 'uses the provided addr' do
              jsonRendered = JSON.parse(template.render(merged_manifest_properties))
              expect(jsonRendered['gateway_address']).to eq('192.168.5.5')
            end

            describe 'but outside the subnet range' do
            let(:merged_manifest_properties) do
              {
                "winc_network" => {
                  'subnet_range' => '192.168.5.0/28',
                  "gateway_address" => "192.168.5.100",
                }
              }
            end
              it 'raises an error' do
                expect do
                  template.render(merged_manifest_properties)
                end.to raise_error /Invalid 'winc_network.gateway_address': /
              end
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
end
