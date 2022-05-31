require 'rspec'
require 'bosh/template/test'
require 'yaml'
require 'json'


module Bosh::Template::Test
  describe 'template rendering' do
    let(:release_path) {File.join(File.dirname(__FILE__), '../..')}
    let(:release) {ReleaseDir.new(release_path)}

    describe 'winc job' do let(:job) {release.job('winc')}
      describe 'credential_spec.json.erb' do
        let(:template) {job.template('config/credential_spec.json')}

        describe 'ccg disabled by default' do
          let(:merged_manifest_properties) do
            {}
          end

          it 'does not render anything in the credential spec file' do
            rendered = template.render(merged_manifest_properties)
            expect(rendered).to eq("\n")
          end
        end

        describe 'ccg enabled' do
          let(:credential_spec_raw) do
            '{"CmsPlugins": [
        "ActiveDirectory"
        ],
        "DomainJoinConfig": {
          "Sid": "S-1-5-21-702590844-1001920913-2680819671",
          "MachineAccountName": "webapp01",
          "Guid": "56d9b66c-d746-4f87-bd26-26760cfdca2e",
          "DnsTreeName": "contoso.com",
          "DnsName": "contoso.com",
          "NetBiosName": "CONTOSO"
        },
        "ActiveDirectoryConfig": {
            "GroupManagedServiceAccounts": [
                {
                    "Name": "webapp01",
                    "Scope": "contoso.com"
                },
                {
                    "Name": "webapp01",
                    "Scope": "CONTOSO"
                }
            ]
        }}'
          end
          let(:merged_manifest_properties) do
            {
              'ccg' => {
                'enabled' => true,
                'plugin_guid' => '{e3c4e4bd-2dde-4676-8550-0aa07a736e2e}',
                'plugin_input' => 'foo:bar@contoso.com',
                'credential_spec' => credential_spec_raw
              }
            }
          end


          it 'renders the properties appropriately' do
            jsonRendered = JSON.parse(template.render(merged_manifest_properties))
            expect(jsonRendered).to eq({
              'CmsPlugins' => [ "ActiveDirectory" ],
              'DomainJoinConfig' => {
                'Sid' => 'S-1-5-21-702590844-1001920913-2680819671',
                'MachineAccountName' => 'webapp01',
                'Guid' => '56d9b66c-d746-4f87-bd26-26760cfdca2e',
                'DnsTreeName' => 'contoso.com',
                'DnsName' => 'contoso.com',
                'NetBiosName' => 'CONTOSO'
              },
              'ActiveDirectoryConfig' => {
                'GroupManagedServiceAccounts' => [
                  {
                    'Name' => 'webapp01',
                    'Scope' => 'contoso.com'
                  },
                  {
                    'Name' => 'webapp01',
                    'Scope' => 'CONTOSO'
                  }
                ],
              'HostAccountConfig' => {
                'PortableCcgVersion' => '1',
                'PluginGUID' => '{e3c4e4bd-2dde-4676-8550-0aa07a736e2e}',
                'PluginInput' => 'foo:bar@contoso.com'
                }
              }
            })
          end

          describe 'validations' do
            describe 'plugin guid' do
              it 'validates presence' do
                merged_manifest_properties['ccg']['plugin_guid'] = nil

                expect do
                  template.render(merged_manifest_properties)
                end.to raise_error(/ccg.plugin_guid is required when ccg.enabled is true/)
              end

              it 'validates structure' do
                merged_manifest_properties['ccg']['plugin_guid'] = "[totally-not-a-guid]"

                expect do
                  template.render(merged_manifest_properties)
                end.to raise_error(/ccg.plugin_guid must be a Microsoft GUID enclosed by curly braces/)

                merged_manifest_properties['ccg']['plugin_guid'] = "xGDMA0342-266A-4D1P-831J-20990E82944Fx"

                expect do
                  template.render(merged_manifest_properties)
                end.to raise_error(/ccg.plugin_guid must be a Microsoft GUID enclosed by curly braces/)
              end
            end

            describe 'plugin input' do
              it 'validates presence of plugin input' do
                merged_manifest_properties['ccg']['plugin_input'] = nil

                expect do
                  template.render(merged_manifest_properties)
                end.to raise_error(/ccg.plugin_input is required when ccg.enabled is true/)
              end
            end

            describe 'credential spec' do
              it 'validates presence' do
                merged_manifest_properties['ccg']['credential_spec'] = nil

                expect do
                  template.render(merged_manifest_properties)
                end.to raise_error(/ccg.credential_spec is required when ccg.enabled is true/)
              end

              it 'validates json-ness' do
                merged_manifest_properties['ccg']['credential_spec'] = "invalid json"

                expect do
                  template.render(merged_manifest_properties)
                end.to raise_error(/ccg.credential_spec must be valid json:/)
              end

              describe 'validates structure' do
                let(:credential_spec_parsed) { JSON.parse(credential_spec_raw) }

                describe 'CmsPlugins' do
                  it 'validates presence' do
                    credential_spec_parsed.delete('CmsPlugins')
                    merged_manifest_properties['ccg']['credential_spec'] = JSON.generate(credential_spec_parsed)

                    expect do
                      template.render(merged_manifest_properties)
                    end.to raise_error(/ccg.credential_spec must contain element "CmsPlugins"/)
                  end

                  it 'has the correct structure' do
                    credential_spec_parsed['CmsPlugins'] = 'asdf'
                    merged_manifest_properties['ccg']['credential_spec'] = JSON.generate(credential_spec_parsed)

                    expect do
                      template.render(merged_manifest_properties)
                    end.to raise_error(/ccg.credential_spec.CmsPlugins must be an array with a single element "ActiveDirectory"/)

                    credential_spec_parsed['CmsPlugins'] = ['asdf']
                    merged_manifest_properties['ccg']['credential_spec'] = JSON.generate(credential_spec_parsed)

                    expect do
                      template.render(merged_manifest_properties)
                    end.to raise_error(/ccg.credential_spec.CmsPlugins must be an array with a single element "ActiveDirectory"/)
                  end
                end

                describe 'DomainJoinConfig' do
                  it 'validates presence' do
                    credential_spec_parsed.delete('DomainJoinConfig')
                    merged_manifest_properties['ccg']['credential_spec'] = JSON.generate(credential_spec_parsed)

                    expect do
                      template.render(merged_manifest_properties)
                    end.to raise_error(/ccg.credential_spec must contain element "DomainJoinConfig"/)
                  end

                  describe 'validates children' do
                    it 'has Sid' do
                      credential_spec_parsed['DomainJoinConfig'].delete('Sid')
                      merged_manifest_properties['ccg']['credential_spec'] = JSON.generate(credential_spec_parsed)

                      expect do
                        template.render(merged_manifest_properties)
                      end.to raise_error(/ccg.credential_spec.DomainJoinConfig must contain element "Sid"/)
                    end

                    it 'has MachineAccountName' do
                      credential_spec_parsed['DomainJoinConfig'].delete('MachineAccountName')
                      merged_manifest_properties['ccg']['credential_spec'] = JSON.generate(credential_spec_parsed)

                      expect do
                        template.render(merged_manifest_properties)
                      end.to raise_error(/ccg.credential_spec.DomainJoinConfig must contain element "MachineAccountName"/)
                    end

                    it 'has Guid' do
                      credential_spec_parsed['DomainJoinConfig'].delete('Guid')
                      merged_manifest_properties['ccg']['credential_spec'] = JSON.generate(credential_spec_parsed)

                      expect do
                        template.render(merged_manifest_properties)
                      end.to raise_error(/ccg.credential_spec.DomainJoinConfig must contain element "Guid"/)
                    end

                    it 'has DnsTreeName' do
                      credential_spec_parsed['DomainJoinConfig'].delete('DnsTreeName')
                      merged_manifest_properties['ccg']['credential_spec'] = JSON.generate(credential_spec_parsed)

                      expect do
                        template.render(merged_manifest_properties)
                      end.to raise_error(/ccg.credential_spec.DomainJoinConfig must contain element "DnsTreeName"/)
                    end

                    it 'has DnsName' do
                      credential_spec_parsed['DomainJoinConfig'].delete('DnsName')
                      merged_manifest_properties['ccg']['credential_spec'] = JSON.generate(credential_spec_parsed)

                      expect do
                        template.render(merged_manifest_properties)
                      end.to raise_error(/ccg.credential_spec.DomainJoinConfig must contain element "DnsName"/)
                    end

                    it 'has NetBiosName' do
                      credential_spec_parsed['DomainJoinConfig'].delete('NetBiosName')
                      merged_manifest_properties['ccg']['credential_spec'] = JSON.generate(credential_spec_parsed)

                      expect do
                        template.render(merged_manifest_properties)
                      end.to raise_error(/ccg.credential_spec.DomainJoinConfig must contain element "NetBiosName"/)
                    end
                  end
                end

                describe 'ActiveDirectoryConfig' do
                  it 'validates presence' do
                    credential_spec_parsed.delete('ActiveDirectoryConfig')
                    merged_manifest_properties['ccg']['credential_spec'] = JSON.generate(credential_spec_parsed)

                    expect do
                      template.render(merged_manifest_properties)
                    end.to raise_error(/ccg.credential_spec must contain element "ActiveDirectoryConfig"/)
                  end

                  it 'contains a single "GroupManagedServiceAccounts" child' do
                    credential_spec_parsed['ActiveDirectoryConfig'].delete('GroupManagedServiceAccounts')
                    merged_manifest_properties['ccg']['credential_spec'] = JSON.generate(credential_spec_parsed)

                    expect do
                      template.render(merged_manifest_properties)
                    end.to raise_error(/ccg.credential_spec.ActiveDirectoryConfig must contain element "GroupManagedServiceAccounts"/)
                  end

                  describe 'GroupManagedServiceAccounts' do
                    it 'is an array' do
                      credential_spec_parsed['ActiveDirectoryConfig']['GroupManagedServiceAccounts'] = 'asdf'
                      merged_manifest_properties['ccg']['credential_spec'] = JSON.generate(credential_spec_parsed)

                      expect do
                        template.render(merged_manifest_properties)
                      end.to raise_error(/ccg.credential_spec.ActiveDirectoryConfig.GroupManagedServiceAccounts must be an array of objects with keys "Name" and "Scope"/)
                    end

                    describe 'entries' do
                      it 'every entry is an hash' do
                        credential_spec_parsed['ActiveDirectoryConfig']['GroupManagedServiceAccounts'] = ['asdf']
                        merged_manifest_properties['ccg']['credential_spec'] = JSON.generate(credential_spec_parsed)

                        expect do
                          template.render(merged_manifest_properties)
                        end.to raise_error(/ccg.credential_spec.ActiveDirectoryConfig.GroupManagedServiceAccounts must be an array of objects with keys "Name" and "Scope"/)
                      end

                      it 'each entry contains both "Name" and "Scope" keys' do
                        credential_spec_parsed['ActiveDirectoryConfig']['GroupManagedServiceAccounts'] = [{'Name' => 'asdf'}]
                        merged_manifest_properties['ccg']['credential_spec'] = JSON.generate(credential_spec_parsed)

                        expect do
                          template.render(merged_manifest_properties)
                        end.to raise_error(/ccg.credential_spec.ActiveDirectoryConfig.GroupManagedServiceAccounts must be an array of objects with keys "Name" and "Scope"/)
                      end

                      it 'each entry ONLY contains "Name" and "Scope" keys' do
                        credential_spec_parsed['ActiveDirectoryConfig']['GroupManagedServiceAccounts'] = [{'Name' => 'asdf', 'Scope' => 'bar', 'Fun' => 'times'}]
                        merged_manifest_properties['ccg']['credential_spec'] = JSON.generate(credential_spec_parsed)

                        expect do
                          template.render(merged_manifest_properties)
                        end.to raise_error(/ccg.credential_spec.ActiveDirectoryConfig.GroupManagedServiceAccounts must be an array of objects with keys "Name" and "Scope"/)
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
