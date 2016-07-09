require 'spec_helper'

RSpec.describe Morse::Cli, type: :aruba do
  it 'should read data from stdin by default' do
    run 'script/run'
    type 'HELLO'
    stop_all_commands

    expect(last_command_started.stdout).to include '4|1|1A2|1A2|C'
  end

  it 'should show error when unknown file was passed' do
    run 'script/run -f unknown.txt'
    stop_all_commands
    expect(last_command_started.stderr).to include 'Cannot load file'
  end

  it 'should read data from passed file' do
    write_file 'tmp/data.txt', "HELLO\nI AM IN TROUBLE"
    run 'script/run -f tmp/data.txt'
    stop_all_commands
    expect(last_command_started.stdout).to include '4|1|1A2|1A2|C'
    expect(last_command_started.stdout).to include '2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1'
  end
end
