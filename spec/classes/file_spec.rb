# frozen_string_literal: true

require 'spec_helper'

describe 'bginfo::file' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) do
        "class { 'bginfo': displayed_facts => ['trusted.extensions.pp_role', 'os.family'] }"
      end

      it { is_expected.to compile.with_all_deps }
      it do
        is_expected.to contain_file('c:/BGInfo')
          .with_ensure('directory')
      end
      it do
        is_expected.to contain_file('c:/BGInfo/PuppetFacts.bgi')
          .with_ensure('file')
          .with_source('puppet:///modules/bginfo/PuppetFacts.bgi')
      end
      it do
        is_expected.to contain_file('c:/BGInfo/PuppetBGInfo.dat')
          .with_ensure('file')
      end
    end
  end
end
