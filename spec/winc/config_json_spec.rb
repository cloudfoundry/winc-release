require 'rspec'
require 'bosh/template/test'
require 'yaml'
require 'json'

module Bosh::Template::Test
  describe 'template rendering' do
    let(:release_path) {File.join(File.dirname(__FILE__), '../..')}
    let(:release) {ReleaseDir.new(release_path)}

    describe 'winc' do let(:job) {release.job('winc')}
    describe 'config.json.erb' do
      let(:template) {job.template('config/config.json')}

      describe 'has backward compatible defaults' do
        let(:merged_manifest_properties) do
          {
          }
        end

        it 'renders the default configs.json' do
          jsonRendered = JSON.parse(template.render(merged_manifest_properties))
          expect(jsonRendered["credhub_endpoint"]).to eq("https://credhub.service.cf.internal:8844")
          expect(jsonRendered["credhub_ca_certificate"]).to eq("")
          expect(jsonRendered["uaa_credhub_client_id"]).to eq("")
          expect(jsonRendered["uaa_credhub_client_secret"]).to eq("")
        end
      end

      describe 'when credhub_endpoint is provided manually' do
        let(:merged_manifest_properties) do
          {
            "winc" => {
              'credhub_endpoint' => 'https://somewhere.else',
            }
          }
        end
        it 'uses the provided endpoint' do
          jsonRendered = JSON.parse(template.render(merged_manifest_properties))
          expect(jsonRendered['credhub_endpoint']).to eq("https://somewhere.else")
        end

        describe 'when credhub_ca_certificate is provided manually' do
          let(:merged_manifest_properties) do
            {
              "winc" => {
                'credhub_ca_certificate' => 'my-cert',
              }
            }
          end

          it 'uses the provided ca cert' do
            jsonRendered = JSON.parse(template.render(merged_manifest_properties))
            expect(jsonRendered['credhub_ca_certificate']).to eq('my-cert')
          end
        end
      end

      describe 'when uaa_credhub_client_id is provided manually' do
        let(:merged_manifest_properties) do
          {
            "winc" => {
              'uaa_credhub_client_id' => 'my-cool-client',
            }
          }
        end
        it 'uses the provided client' do
          jsonRendered = JSON.parse(template.render(merged_manifest_properties))
          expect(jsonRendered['uaa_credhub_client_id']).to eq("my-cool-client")
        end

        describe 'when uaa_credhub_client_secret is provided manually' do
          let(:merged_manifest_properties) do
            {
              "winc" => {
                'uaa_credhub_client_secret' => 'my-secret',
              }
            }
          end

          it 'uses the provided client secret' do
            jsonRendered = JSON.parse(template.render(merged_manifest_properties))
            expect(jsonRendered['uaa_credhub_client_secret']).to eq('my-secret')
          end
        end
      end
    end
    end
  end
end
