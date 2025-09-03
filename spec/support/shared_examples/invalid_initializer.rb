RSpec.shared_examples 'rejects invalid input' do
  it 'raises ArgumentError' do
    expect { build_call.call }.to raise_error(ArgumentError, /Invalid/)
  end
end
