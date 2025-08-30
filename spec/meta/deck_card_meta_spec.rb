# frozen_string_literal: true

describe '[LAB CHECKER] Deck and Card Organization Spec Requirements' do
  files = Dir[File.expand_path('../../student/*_spec.rb', __FILE__)]

  it 'has at least one student spec file in spec/student/' do
    expect(files.any?).to be true, 'Expected at least one spec file in spec/student/'
  end

  files.each do |file|
    content = File.read(file)

    it "uses context and/or nested describe blocks for Deck or Card in #{File.basename(file)}" do
      expect(content).to match(/context\s*\(|describe\s*\(/), 'Expected to find context or describe blocks.'
      expect(content).to match(/Deck|Card/), 'Expected to find Deck or Card referenced in describe/context blocks.'
    end

    it "uses subject or let for repeated objects in #{File.basename(file)}" do
      expect(content).to match(/subject\s*\{|let\s*\(/), 'Expected student specs to use subject or let for repeated objects.'
    end

    it "uses shared examples if appropriate in #{File.basename(file)}" do
      expect(content).to match(/shared_examples|it_behaves_like/), 'Expected student specs to use shared_examples or it_behaves_like.'
    end

    it "has at least 2 'it' blocks in #{File.basename(file)}" do
      expect(content.scan(/it\s+['"]/).size).to be >= 2
    end
  end
end
