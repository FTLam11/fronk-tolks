class RubyClass end;

describe RubyClass do
  it 'keeps a reference to self' do
    block = lambda {
    }

    expect { block.call }.to output('RubyClass').to_stdout
  end
end
