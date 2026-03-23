# frozen_string_literal: true

require 'spec_helper'

describe 'bginfo::package' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
      it do
        is_expected.to contain_file('C:/BGInfo/BGInfo64.exe')
          .with_ensure('file').with_source('puppet:///modules/bginfo/BGInfo64.exe')
      end
      it do
        is_expected.to contain_registry_value('BGInfo')
          .with_ensure('present')
          .with_path('HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\BGInfo')
          .with_type('string')
          .with_data('c:\bginfo\BGInfo64.exe C:\BGInfo\PuppetFacts.bgi /timer:0/SILENT /NOLICPROMPT')
      end
    end
  end
end
