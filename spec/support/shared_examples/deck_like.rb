shared_examples 'a stack-like deck' do
  it 'reduces size when drawing' do
    start = subject.size
    subject.draw
    expect(subject.size).to eq(start - 1)
  end

  it 'eventually becomes empty' do
    subject.size.times { subject.draw }
    expect(subject).to be_empty
  end
end
