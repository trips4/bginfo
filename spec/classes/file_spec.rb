# frozen_string_literal: true

require 'spec_helper'

describe 'bginfo::file' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) do
        "class { 'bginfo': displayed_facts => ['trusted.extensions.pp_role', 'os.family'] }"
      end
      let(:os_family) do
        os_data = facts['os'] || facts[:os] || {}
        os_data['family'] || os_data[:family]
      end
      let(:trusted_facts) do
        {
          'pp_role' => 'web',
        }
      end

      it { is_expected.to compile.with_all_deps }
      it do
        is_expected.to contain_file_line('BGInfo Task trusted.extensions.pp_role')
          .with('line' => 'trusted.extensions.pp_role: web')
      end
      it do
        is_expected.to contain_file_line('BGInfo Task os.family')
          .with('line' => "os.family: #{os_family}")
      end
    end
  end
end
